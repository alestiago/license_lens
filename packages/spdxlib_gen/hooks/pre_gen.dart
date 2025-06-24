// Copyright (c) 2025 Alejandro Santiago
//
// This file is part of spdxlib_gen and is distributed under the terms of
// the MIT License.
//
// For complete licensing information, please refer to the README file:
// https://github.com/alestiago/license_lens/blob/main/packages/spdxlib_gen/LICENSE
//
// Full attribution information is provided in the NOTICE file:
// https://github.com/alestiago/license_lens/blob/main/packages/spdxlib_gen/NOTICE.md

/// A generator that creates the SPDX License enumeration.
///
/// For more information, see the `README.md`.
library;

import 'dart:io';

import 'package:mason/mason.dart';
import 'package:meta/meta.dart';
import 'package:spdxlib_hooks/spdxlib.dart';

@visibleForTesting
DownloadLicenses? downloadLicensesOverride;

/// {@macro pre_gen}
Future<void> run(HookContext context) async => preGen(context);

/// {@template pre_gen}
/// Populates the context `licenses` variable with the SPDX license list, and
/// the `total` variable with the total number of licenses.
///
/// If the user decides to use their own license list, the `licenses` variable
/// will be populated with the user's list. Otherwise, the SPDX license list
/// will be downloaded and parsed from the same source as the PANA tool.
/// {@endtemplate}
@visibleForTesting
Future<void> preGen(HookContext context) async {
  try {
    final licensesVar = context.vars['licenses'];
    final shouldFetchLicenses =
        (licensesVar == null || (licensesVar is List && licensesVar.isEmpty)) &&
        licensesVar is! List<String>;

    late List<String> licenses;
    if (shouldFetchLicenses) {
      licenses = await _dowloadLicenses(logger: context.logger);
    } else {
      if (licensesVar is! List<String>) {
        context.logger.err(
          'The "licenses" variable is not a List<String> or null',
        );
        return;
      }
      licenses = licensesVar;
    }

    final newLicensesVar = <Map<String, dynamic>>[
      for (final license in licenses)
        {
          'license': license,
          'identifier': license.toDartIdentifier(),
        },
    ];

    context.vars = {'licenses': newLicensesVar, 'total': newLicensesVar.length};
  } on Exception catch (e) {
    context.logger.err(
      '''[spdxlib] An unknown error occurred, received error: $e''',
    );
  }
}

extension on String {
  String toDartIdentifier() {
    return '\$$this'
        .replaceAll('-', '_')
        .replaceAll('.', '_')
        .replaceAll(' ', '')
        .replaceAll('+', 'plus')
        .trim();
  }
}

Future<Licenses> _dowloadLicenses({
  required Logger logger,
}) async {
  final progress = logger.progress(
    'Starting to download the SPDX license list, this might take some time',
  );

  late Licenses licenses;
  try {
    licenses = await (downloadLicensesOverride?.call() ?? downloadLicenses());
  } on GenerateSpdxLicenseException catch (e) {
    progress.cancel();
    logger.err(e.message);
    exit(ExitCode.unavailable.code);
  } on Object {
    rethrow;
  }

  progress.complete('Found ${licenses.length} SPDX licenses');
  return licenses;
}
