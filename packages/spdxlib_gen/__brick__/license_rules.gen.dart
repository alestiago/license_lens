// GENERATED CODE - DO NOT MODIFY BY HAND
// 
// If you would like to modify this file consider contributing to the
// SPDX License brick. 
//
// Further contribution information can be found at:
// https://github.com/alestiago/license_lens/blob/main/packages/spdxlib_gen/CONTRIBUTING.md

// Copyright (c) 2025 Alejandro Santiago
//
// This file is part of spdxlib and is distributed under the terms of
// the MIT License.
//
// For complete licensing information, please refer to the README file:
// https://github.com/alestiago/license_lens/blob/main/packages/spdxlib/LICENSE
//
// Full attribution information is provided in the NOTICE file:
// https://github.com/alestiago/license_lens/blob/main/packages/spdxlib/NOTICE.md

// ignore_for_file: type=lint

/// List of all license rules.
///
/// This file was automatically generated with the SPDX License brick.
library license_rules;

/// {@template LicenseRules}
/// The possible permissions, conditions, and limitations for a license.
///
/// The classification of licenses permissions, conditions, and limitations
/// is based on those made by [ChooseALicense](https://choosealicense.com/).
/// {@endtemplate}
class LicenseRules {
  // {@macro LicenseRules}
  const LicenseRules({
    this.permissions,
    this.conditions,
    this.limitations,
  });

  /// The permissions that the license grants.
  ///
  /// If empty, the license does not grant any permissions.
  ///
  /// Null when the permissions could not be determined.
  final Set<LicensePermission>? permissions;

  /// The conditions that the license imposes.
  ///
  /// If empty, the license does not impose any conditions.
  ///
  /// Null when the conditions could not be determined.
  final Set<LicenseCondition>? conditions;

  /// The limitations that the license imposes.
  ///
  /// If empty, the license does not impose any limitations.
  ///
  /// Null when the limitations could not be determined.
  final Set<LicenseLimitation>? limitations;
}

/// The possible permissions for a license.
///
/// These have been automatically generated from the ChooseALicense rules.
/// 
/// See also:
/// 
/// * [ChooseALicense rules](https://github.com/github/choosealicense.com/blob/gh-pages/_data/rules.yml)
enum LicensePermission {
  {{#rules.permissions}}
  /// {{description}}
  {{tag.camelCase()}}._('{{label}}'),
  {{/rules.permissions}}

  ;const LicensePermission._(this.label);

  /// The label of the permission.
  final String label;
}

/// The possible conditions for a license.
///
/// These have been automatically generated from the ChooseALicense rules.
/// 
/// See also:
/// 
/// * [ChooseALicense rules](https://github.com/github/choosealicense.com/blob/gh-pages/_data/rules.yml)
enum LicenseCondition {
  {{#rules.conditions}}
  /// {{description}}
  {{tag.camelCase()}}._('{{label}}'),
  {{/rules.conditions}}

  ;const LicenseCondition._(this.label);

  /// The label of the condition.
  final String label;
}

/// The possible limitations for a license.
///
/// These have been automatically generated from the ChooseALicense rules.
/// 
/// See also:
/// 
/// * [ChooseALicense rules](https://github.com/github/choosealicense.com/blob/gh-pages/_data/rules.yml)
enum LicenseLimitation {
  {{#rules.limitations}}
  /// {{description}}
  {{tag.camelCase()}}._('{{label}}'),
  {{/rules.limitations}}

  ;const LicenseLimitation._(this.label);

  /// The label of the limitation.
  final String label;
}

