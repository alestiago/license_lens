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

import 'package:http/http.dart' as http;
import 'package:mason/mason.dart';
import 'package:meta/meta.dart';
import 'package:spdxlib_hooks/spdxlib.dart';

part 'licenses.dart';
part 'rules.dart';

/// The type for the Mason context variables used in the pre-gen hook.
typedef MasonContextVariables = Map<String, dynamic>;

/// Signature for overriding [downloadRules].
typedef DownloadRules = Future<Rules> Function();

/// Signature for overriding [downloadLicenseRules].
typedef DownloadLicenseRules = Future<AllLicenseRules> Function();

/// Signature for overriding [downloadLicenses].
typedef DownloadLicenses = Future<Licenses> Function();

/// Defines the context variables used by the pre-gen hook.
enum ContextVariables {
  /// The list of license identifiers.
  licenses._('licenses'),

  /// The total number of licenses available.
  total._('total'),

  /// JSON object of the retrieves [Rules].
  rules._('rules');

  const ContextVariables._(this.name);

  /// The name of the context variable.
  final String name;
}

@visibleForTesting
/// Allows overriding [downloadLicenses] function for testing purposes.
DownloadLicenses? downloadLicensesOverride;

@visibleForTesting
/// Allows overriding [downloadRules] function for testing purposes.
DownloadRules? downloadRulesOverride;

@visibleForTesting
/// Allows overriding [downloadLicenseRules] function for testing purposes.
DownloadLicenseRules? downloadLicenseRulesOverride;

http.Client _client = http.Client();

/// {@macro pre_gen}
Future<void> run(HookContext context) async => preGen(context);

void _close() {
  _client.close();
}

void _exit(int code) {
  _close();
  exit(code);
}

/// {@template pre_gen}
/// Populates the context `licenses` variable with the SPDX license list, and
/// the `total` variable with the total number of licenses.
///
/// If the user decides to use their own license list, the `licenses` variable
/// will be populated with the user's list. Otherwise, the SPDX license list
/// will be downloaded and parsed from the same source as the PANA tool.
/// {@endtemplate}
Future<void> preGen(HookContext context) async {
  try {
    final licenses = await _licensesVariables(context);
    final rules = await _rulesVariables(context);

    context.vars = {
      ...licenses,
      ...rules,
    };
  } on Exception catch (e) {
    context.logger.err(
      '''[spdxlib] An unknown error occurred, received error: $e''',
    );
  }
}
