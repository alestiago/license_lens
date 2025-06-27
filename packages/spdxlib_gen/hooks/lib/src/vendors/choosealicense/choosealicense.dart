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

/// {@template ChooseALicenseException}
/// An exception thrown when interacting with the ChooseALicense source.
/// {@endtemplate}
class ChooseALicenseException implements Exception {
  /// {@macro ChooseALicenseException}
  const ChooseALicenseException(String message)
    : message = '[spdxlib] $message';

  /// Describes the error message.
  final String message;

  @override
  String toString() => message;
}

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

  late dynamic yaml;
  try {
    yaml = loadYaml(response.body);
  } on Exception catch (_) {
    throw ChooseALicenseException(
      '''Failed to parse the ChooseALicense rules, received response: ${response.body}''',
    );
  }

  if (yaml is! YamlMap) {
    throw ChooseALicenseException(
      '''Failed to parse the ChooseALicense rules, expected a YAML map but got: $yaml.runtimeType''',
    );
  }

  final jsonString = jsonEncode(yaml);
  return rulesFromJson(jsonString);
}

/// The URL where the ChooseALicense rule definitions are hosted.
@visibleForTesting
const licenseRulesUrl =
    'https://api.github.com/repos/github/choosealicense.com/contents/_licenses';

/// All the licenses (indexed by their SPDX identifier) and their rules.
typedef AllLicenseRules = Map<String, LicenseRules>;

/// Downloads the rules for all licenses defined by ChooseALicense.
Future<AllLicenseRules> downloadLicenseRules({
  required http.Client client,
}) async {
  final httpClient = client;
  final response = await httpClient.get(Uri.parse(licenseRulesUrl));

  if (response.statusCode != 200) {
    throw ChooseALicenseException(
      'Failed to download the ChooseALicense rules, received status code: '
      '${response.statusCode}',
    );
  }

  late List<GithubContent> gitHubContent;
  try {
    gitHubContent = githubContentFromJson(response.body);
  } on Exception {
    throw ChooseALicenseException(
      'Failed to parse the ChooseALicense rules, received response: '
      '${response.body}',
    );
  }

  final allLicenseRules = AllLicenseRules();
  for (final licenseFile in gitHubContent) {
    final downloadUrl = licenseFile.downloadUrl;
    final response = await httpClient.get(Uri.parse(downloadUrl));

    if (response.statusCode != 200) {
      throw ChooseALicenseException(
        'Failed to download the license rules for ${licenseFile.name}, '
        'received status code: ${response.statusCode}',
      );
    }

    final content = response.body;
    final start = content.indexOf('---');
    final end = content.indexOf('---', start + 3);
    if (start == -1 || end == -1) {
      throw ChooseALicenseException(
        'Failed to parse the license rules for ${licenseFile.name}, expected a '
        'section between `---` lines.',
      );
    }

    final header = content.substring(start + 3, end).trim();
    final yaml = loadYaml(header);
    if (yaml is! YamlMap) {
      throw ChooseALicenseException(
        'Failed to parse the license rules for ${licenseFile.name}, expected a '
        'YAML map but got: ${yaml.runtimeType}',
      );
    }

    late final LicenseRules licenseRules;
    try {
      final jsonString = jsonEncode(yaml);
      licenseRules = licenseRulesFromJson(jsonString);
    } on Exception {
      throw ChooseALicenseException(
        'Failed to parse the license rules for ${licenseFile.name}, received '
        'response: $content',
      );
    }

    allLicenseRules[licenseRules.spdxId] = licenseRules;
  }

  return allLicenseRules;
}
