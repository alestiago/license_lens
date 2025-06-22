// Copyright (c) 2025 Alejandro Santiago
//
// This file is part of spdxlib and is distributed under the terms of the
// MIT License.
//
// For complete licensing information, please refer to the README file:
// https://github.com/alestiago/license_lens/blob/main/packages/spdxlib/LICENSE
//
// Full attribution information is provided in the NOTICE file:
// https://github.com/alestiago/license_lens/blob/main/packages/spdxlib/NOTICE.md

import 'package:spdxlib/spdxlib.dart';
import 'package:test/test.dart';

void main() {
  group(SpdxLicense, () {
    const invalidLicenseSource = 'invalid';

    group('parse', () {
      test('can parse a valid SPDX license', () {
        expect(SpdxLicense.parse('MIT'), SpdxLicense.$MIT);
      });

      test('can parse "unknown"', () {
        expect(SpdxLicense.parse('unknown'), SpdxLicense.$unknown);
      });

      test('throws on invalid SPDX license', () {
        expect(
          () => SpdxLicense.parse(invalidLicenseSource),
          throwsA(
            isA<FormatException>().having(
              (exception) => exception.message,
              'message',
              'Failed to parse $invalidLicenseSource as SpdxLicense.',
            ),
          ),
        );
      });
    });

    group('tryParse', () {
      test('can parse a valid SPDX license', () {
        expect(SpdxLicense.tryParse('MIT'), SpdxLicense.$MIT);
      });

      test('can parse "unknown"', () {
        expect(SpdxLicense.tryParse('unknown'), SpdxLicense.$unknown);
      });

      test('returns null on invalid SPDX license', () {
        expect(SpdxLicense.tryParse(invalidLicenseSource), isNull);
      });
    });

    group('identifier', () {
      test('returns the identifier for a valid SPDX license', () {
        expect(SpdxLicense.$MIT.identifier, 'MIT');
        expect(SpdxLicense.$BSD_2_Clause.identifier, 'BSD-2-Clause');
      });

      test('returns "unknown" for the unknown license', () {
        expect(SpdxLicense.$unknown.identifier, 'unknown');
      });
    });
  });
}
