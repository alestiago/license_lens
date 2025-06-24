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

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:spdxlib_hooks/spdxlib.dart';
import 'package:yaml/yaml.dart';

export 'models/models.dart';

/// The URL where the ChooseALicense rule definitions are hosted.
@visibleForTesting
const rulesUrl =
    'https://raw.githubusercontent.com/github/choosealicense.com/refs/heads/gh-pages/_data/rules.yml';

/// The public [DownloadRules] function signature.
typedef DownloadRules =
    Future<Rules> Function({
      @visibleForTesting http.Client? client,
    });

/// Dowloads the rules a license may have.
///
/// Rules are a set of permissions, conditions, and limitations that a license
/// a may impose.
///
/// See also:
///
/// * [rulesUrl], which defines the URL where the rules are hosted.
Future<Rules> downloadRules({
  required http.Client client,
}) async {
  final httpClient = client;
  final response = await httpClient.get(Uri.parse(rulesUrl));

  if (response.statusCode != 200) {
    throw ChooseALicenseException(
      '''Failed to download the ChooseALicense rules, received status code: ${response.statusCode}''',
    );
  }

  final yaml = loadYaml(response.body);
  if (yaml is! YamlMap) {
    throw ChooseALicenseException(
      '''Failed to parse the ChooseALicense rules, expected a YAML map but got: $yaml.runtimeType''',
    );
  }

  final jsonString = jsonEncode(yaml);
  return rulesFromJson(jsonString);
}

/// {@template ChooseALicenseException}
/// An exception thrown when interacting with the ChooseALicense source.
/// {@endtemplate}
class ChooseALicenseException implements Exception {
  /// {@macro ChooseALicenseException}
  const ChooseALicenseException(String message)
    : message = '[spdxlib] $message';

  /// Describes the error message.
  final String message;
}
