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

import 'package:archive/archive.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:path/path.dart' as path;

/// Collection of licenses.
typedef Licenses = List<String>;

/// The SPDX license list URL.
///
/// This is the URL of the SPDX license list data on GitHub.
///
/// It is also the one used by the [PANA tool to download the license list](https://github.com/dart-lang/pana/blob/master/third_party/spdx/update_licenses.dart).
@visibleForTesting
const spdxLicenseListUrl =
    'https://github.com/spdx/license-list-data/archive/refs/heads/master.zip';

/// The directory path from the downloadable [spdxLicenseListUrl] that
/// contains the SPDX license list data.
///
/// This is also the license list path used by the PANA tool.
const _spdxTargetPath = 'license-list-data-main/json/details';

/// The public [downloadLicenses] function signature.
typedef DownloadLicenses = Future<Licenses> Function();

/// Downloads the SPDX license list and returns the list of license IDs.
///
/// For example, the list might be:
/// ```dart
/// ['Apache-2.0', 'MIT', ...]
/// ```
///
/// Throws a [GenerateSpdxLicenseException] if the download or decoding fails.
Future<Licenses> downloadLicenses({
  @visibleForTesting http.Client? client,
  @visibleForTesting ZipDecoder? zipDecoder,
}) async {
  final httpClient = client ?? http.Client();
  final response = await httpClient.get(Uri.parse(spdxLicenseListUrl));

  if (response.statusCode != 200) {
    throw GenerateSpdxLicenseException(
      '''Failed to download the SPDX license list, received response with status code: ${response.statusCode}''',
    );
  }

  late final Archive archive;
  try {
    final decoder = zipDecoder ?? ZipDecoder();
    archive = decoder.decodeBytes(response.bodyBytes);
  } catch (e) {
    throw GenerateSpdxLicenseException(
      'Failed to decode the SPDX license list, received error: $e',
    );
  }

  final licenses = <String>{};
  for (final file in archive.files) {
    final filename = file.name;
    if (!filename.startsWith(_spdxTargetPath)) continue;

    final license = path.basename(path.withoutExtension(filename));
    licenses.add(license);
  }

  return licenses.toList()..sort();
}

/// {@template generate_spdx_license_exception}
/// An exception thrown by the Generate SPDX License tool.
/// {@endtemplate}
class GenerateSpdxLicenseException implements Exception {
  /// {@macro generate_spdx_license_exception}
  const GenerateSpdxLicenseException(String message)
    : message = '[spdxlib] $message';

  /// Describes the error message.
  final String message;
}
