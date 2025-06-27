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

import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spdxlib_hooks/spdxlib.dart';
import 'package:test/test.dart';

import 'fixtures/license_rules_fixture.dart';
import 'fixtures/rules_fixture.dart';

class _MockClient extends Mock implements Client {}

void main() {
  group('downloadRules', () {
    late Client client;

    setUp(() {
      client = _MockClient();
      registerFallbackValue(Uri.parse('https://example.com'));
    });

    test('returns rules from valid fixture', () async {
      final response = Response(
        ChooseALicenseRulesFixture.success,
        200,
      );
      when(() => client.get(any())).thenAnswer((_) async => response);

      final result = await downloadRules(client: client);

      expect(
        result,
        isA<Rules>()
            .having((r) => r.permissions.length, 'permissions length', 5)
            .having((r) => r.conditions.length, 'conditions length', 8)
            .having((r) => r.limitations.length, 'limitations length', 4)
            .having(
              (r) => r.permissions.first.label,
              'first permission label',
              'Commercial use',
            )
            .having(
              (r) => r.conditions.first.label,
              'first condition label',
              'License and copyright notice',
            )
            .having(
              (r) => r.limitations.first.label,
              'first limitation label',
              'Trademark use',
            ),
      );
    });

    test('throws a ChooseALicenseException given invalid yaml', () async {
      final response = Response(
        ChooseALicenseRulesFixture.invalidYaml,
        200,
      );
      when(() => client.get(any())).thenAnswer((_) async => response);

      expect(
        () async => downloadRules(client: client),
        throwsA(isA<ChooseALicenseException>()),
      );
    });

    test('throws a ChooseALicenseException given invalid yaml map', () async {
      final response = Response(
        ChooseALicenseRulesFixture.invalidYamlMap,
        200,
      );
      when(() => client.get(any())).thenAnswer((_) async => response);

      expect(
        () async => downloadRules(client: client),
        throwsA(isA<ChooseALicenseException>()),
      );
    });

    test('throws a ChooseALicenseException on non-200 response', () async {
      final response = Response('Not Found', 404);
      when(() => client.get(any())).thenAnswer((_) async => response);

      expect(
        () async => downloadRules(client: client),
        throwsA(isA<ChooseALicenseException>()),
      );
    });
  });

  group('downloadLicenseRules', () {
    late Client client;
    late Uri licenseRulesUri;
    late Uri downloadUri;

    setUp(() {
      client = _MockClient();
      licenseRulesUri = Uri.parse(licenseRulesUrl);

      downloadUri = Uri.parse('https://example.com/download-rules');
      registerFallbackValue(downloadUri);
    });

    test('returns all license rules from valid fixture', () async {
      final licenseRulesResponse = Response(
        ChooseALicenseLicenseRulesFixture.successGitHubContent,
        200,
      );
      when(
        () => client.get(licenseRulesUri),
      ).thenAnswer((_) async => licenseRulesResponse);

      final licenseRuleResponse = Response(
        ChooseALicenseLicenseRulesFixture.successLicense,
        200,
      );
      when(
        () => client.get(
          any(
            that: isA<Uri>().having(
              (uri) => uri.toString(),
              'toString',
              endsWith('.txt'),
            ),
          ),
        ),
      ).thenAnswer((_) async => licenseRuleResponse);

      final result = await downloadLicenseRules(client: client);

      expect(result.length, equals(1));
    });

    test('throws ChooseALicenseException on non-200 response', () async {
      final licenseRulesResponse = Response('Not Found', 404);
      when(
        () => client.get(licenseRulesUri),
      ).thenAnswer((_) async => licenseRulesResponse);

      expect(
        () async => downloadLicenseRules(client: client),
        throwsA(isA<ChooseALicenseException>()),
      );
    });

    test('throws ChooseALicenseException on invalid JSON', () async {
      final licenseRulesResponse = Response(
        ChooseALicenseLicenseRulesFixture.invalidJsonGitHubContent,
        200,
      );
      when(
        () => client.get(licenseRulesUri),
      ).thenAnswer((_) async => licenseRulesResponse);

      expect(
        () async => downloadLicenseRules(client: client),
        throwsA(isA<ChooseALicenseException>()),
      );
    });

    test('throws ChooseALicenseException on invalid license text', () async {
      final licenseRulesResponse = Response(
        ChooseALicenseLicenseRulesFixture.successGitHubContent,
        200,
      );
      when(
        () => client.get(licenseRulesUri),
      ).thenAnswer((_) async => licenseRulesResponse);

      final licenseRuleResponse = Response(
        ChooseALicenseLicenseRulesFixture.invalidLicenseText,
        200,
      );
      when(
        () => client.get(
          any(
            that: isA<Uri>().having(
              (uri) => uri.toString(),
              'toString',
              endsWith('.txt'),
            ),
          ),
        ),
      ).thenAnswer((_) async => licenseRuleResponse);

      expect(
        () async => downloadLicenseRules(client: client),
        throwsA(isA<ChooseALicenseException>()),
      );
    });
  });
}
