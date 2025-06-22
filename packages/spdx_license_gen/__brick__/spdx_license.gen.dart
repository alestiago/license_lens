// GENERATED CODE - DO NOT MODIFY BY HAND
// 
// If you would like to modify this file consider contributing to the
// SPDX License brick. 
//
// Further contribution information can be found at:
// https://github.com/alestiago/license_lens/blob/main/packages/spdx_license_gen/CONTRIBUTING.md

// Copyright (c) 2025 Alejandro Santiago
//
// This file is part of spdx_license and is distributed under the terms of the
// MIT License.
//
// For complete licensing information, please refer to the README file:
// https://github.com/alestiago/license_lens/blob/main/packages/spdx_license/LICENSE
//
// Full attribution information is provided in the NOTICE file:
// https://github.com/alestiago/license_lens/blob/main/packages/spdx_license/NOTICE.md

// ignore_for_file: type=lint

/// List of all SPDX licenses.
///
/// This file was automatically generated with the SPDX License brick.
library spdx_license;

/// {@template spdx_license}
/// A list of all {{total}} SPDX licenses.
///
/// These have been automatically generated from the SPDX License brick.
/// {@endtemplate}
enum SpdxLicense {
  {{#licenses}}{{{identifier}}}._('{{{license}}}'),
  {{/licenses}}$unknown._('unknown');

  const SpdxLicense._(this.identifier);

  /// Parses a [String] into a [SpdxLicense].
  ///
  /// If the [source] is not a valid [SpdxLicense], a [FormatException] is
  /// thrown.
  /// 
  /// Rather than throwing and immediately catching the [FormatException], 
  /// instead use [tryParse] to handle a potential parsing error.
  factory SpdxLicense.parse(String source) {
    final result = SpdxLicense.tryParse(source);
    if (result == null) {
      throw FormatException('Failed to parse $source as SpdxLicense.');
    }
    return result;
  }

  /// Parse [source] into a possible [SpdxLicense].
  ///
  /// Like [SpdxLicense.parse] except that it returns `null` where a similar
  /// call to [SpdxLicense.parse] would throw a [FormatException].
  static SpdxLicense? tryParse(String source) => _identifierMap[source];

  static final Map<String, SpdxLicense> _identifierMap = SpdxLicense.values
    .asNameMap()
    .map((key, value) => MapEntry(value.identifier, value));

  /// The identifier of the license, as seen in the [SPDX License List](https://spdx.org/licenses/).
  final String identifier;
}
