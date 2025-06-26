// GENERATED CODE - DO NOT MODIFY BY HAND
//
// If you would like to modify this file consider contributing to the
// spdxlib brick.
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
/// This file was automatically generated with the spdxlib brick.
library license_rules;

/// {@template LicenseRules}
/// The possible permissions, conditions, and limitations for a license.
///
/// The classification of licenses permissions, conditions, and limitations
/// is based on those made by [choosealicense.com](https://choosealicense.com/).
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
/// These have been automatically generated from choosealicense.com's rules.
///
/// See also:
///
/// * [choosealicense.com's rules](https://github.com/github/choosealicense.com/blob/gh-pages/_data/rules.yml)
enum LicensePermission {
  /// The licensed material and derivatives may be used for commercial purposes.
  commercialUse._('Commercial use'),

  /// The licensed material may be modified.
  modifications._('Modification'),

  /// The licensed material may be distributed.
  distribution._('Distribution'),

  /// The licensed material may be used and modified in private.
  privateUse._('Private use'),

  /// This license provides an express grant of patent rights from contributors.
  patentUse._('Patent use');

  const LicensePermission._(this.label);

  /// The label of the permission.
  final String label;
}

/// The possible conditions for a license.
///
/// These have been automatically generated from choosealicense.com's rules.
///
/// See also:
///
/// * [choosealicense.com's rules](https://github.com/github/choosealicense.com/blob/gh-pages/_data/rules.yml)
enum LicenseCondition {
  /// A copy of the license and copyright notice must be included with the licensed material.
  includeCopyright._('License and copyright notice'),

  /// A copy of the license and copyright notice must be included with the licensed material in source form, but is not required for binaries.
  includeCopyrightSource._('License and copyright notice for source'),

  /// Changes made to the licensed material must be documented.
  documentChanges._('State changes'),

  /// Source code must be made available when the licensed material is distributed.
  discloseSource._('Disclose source'),

  /// Users who interact with the licensed material via network are given the right to receive a copy of the source code.
  networkUseDisclose._('Network use is distribution'),

  /// Modifications must be released under the same license when distributing the licensed material. In some cases a similar or related license may be used.
  sameLicense._('Same license'),

  /// Modifications of existing files must be released under the same license when distributing the licensed material. In some cases a similar or related license may be used.
  sameLicenseFile._('Same license (file)'),

  /// Modifications must be released under the same license when distributing the licensed material. In some cases a similar or related license may be used, or this condition may not apply to works that use the licensed material as a library.
  sameLicenseLibrary._('Same license (library)');

  const LicenseCondition._(this.label);

  /// The label of the condition.
  final String label;
}

/// The possible limitations for a license.
///
/// These have been automatically generated from choosealicense.com's rules.
///
/// See also:
///
/// * [choosealicense.com's rules](https://github.com/github/choosealicense.com/blob/gh-pages/_data/rules.yml)
enum LicenseLimitation {
  /// This license explicitly states that it does NOT grant trademark rights, even though licenses without such a statement probably do not grant any implicit trademark rights.
  trademarkUse._('Trademark use'),

  /// This license includes a limitation of liability.
  liability._('Liability'),

  /// This license explicitly states that it does NOT grant any rights in the patents of contributors.
  patentUse._('Patent use'),

  /// This license explicitly states that it does NOT provide any warranty.
  warranty._('Warranty');

  const LicenseLimitation._(this.label);

  /// The label of the limitation.
  final String label;
}
