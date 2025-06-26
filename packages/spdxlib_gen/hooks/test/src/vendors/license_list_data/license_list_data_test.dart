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
import 'package:mocktail/mocktail.dart';
import 'package:spdxlib_hooks/src/vendors/vendors.dart';
import 'package:test/test.dart';

import '../../../test_tag.dart';

class _MockZipDecoder extends Mock implements ZipDecoder {}

class _MockHttpClient extends Mock implements http.Client {}

class _MockArchive extends Mock implements Archive {}

class _MockArchiveFile extends Mock implements ArchiveFile {}

void main() {
  group('downloadLicenses', () {
    late ZipDecoder zipDecoder;
    late http.Client httpClient;
    late http.Response response;
    late Archive archive;
    late Uri uri;

    setUp(() {
      uri = Uri.parse(spdxLicenseListUrl);

      httpClient = _MockHttpClient();
      response = http.Response('Valid response body', 200);
      when(() => httpClient.get(uri)).thenAnswer(
        (_) async => response,
      );

      zipDecoder = _MockZipDecoder();
      archive = _MockArchive();
      when(
        () => zipDecoder.decodeBytes(response.bodyBytes),
      ).thenReturn(archive);
    });

    test(
      'downloads licenses successfully',
      tags: [TestTag.e2e],
      () async {
        final client = http.Client();
        addTearDown(client.close);

        final result = await downloadLicenses(client: client);
        expect(result.length, isNotNull);
      },
    );

    test('reports license correctly', () async {
      final file = _MockArchiveFile();
      when(() => archive.files).thenReturn([file]);
      when(
        () => file.name,
      ).thenReturn('license-list-data-main/json/details/Apache-2.0.json');

      final result = await downloadLicenses(
        client: httpClient,
        zipDecoder: zipDecoder,
      );

      expect(result, contains('Apache-2.0'));
    });

    group('throws $GenerateSpdxLicenseException', () {
      test('when response statusCode is 200', () async {
        when(() => httpClient.get(uri)).thenAnswer(
          (_) async => http.Response('Invalid response body', 200),
        );

        expect(
          () async => downloadLicenses(
            client: httpClient,
            zipDecoder: zipDecoder,
          ),
          throwsA(isA<GenerateSpdxLicenseException>()),
        );
      });

      test('when decoder fails to decodeBytes', () {
        when(
          () => zipDecoder.decodeBytes(response.bodyBytes),
        ).thenThrow(Exception('Decode error'));

        expect(
          () async => downloadLicenses(
            client: httpClient,
            zipDecoder: zipDecoder,
          ),
          throwsA(isA<GenerateSpdxLicenseException>()),
        );
      });
    });
  });
}
