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

/// Defined tags for tests.
///
/// Use these tags to group tests and run them separately.
///
/// Tags are defined within the `dart_test.yaml` file.
///
/// See also:
///
/// * [Dart Test Configuration documentation](https://github.com/dart-lang/test/blob/master/pkgs/test/doc/configuration.md)
abstract class TestTag {
  /// Should only be run on CI.
  static const ci = 'ci';
}
