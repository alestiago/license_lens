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

import 'package:mason/mason.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spdxlib_hooks/spdxlib.dart' hide preGen;
import 'package:spdxlib_hooks/src/pre_gen/pre_gen.dart' as pre_gen;
import 'package:test/test.dart';

class _MockLogger extends Mock implements Logger {}

class _MockProgress extends Mock implements Progress {}

class _TestHookContext implements HookContext {
  _TestHookContext({required Logger logger}) : _logger = logger;

  final Logger _logger;

  @override
  Map<String, dynamic> vars = {};

  @override
  Logger get logger => _logger;
}

void main() {
  group('pre_gen', () {
    late HookContext context;
    late Logger logger;
    late Progress progress;
    late TestOverrides testOverrides;

    setUp(() {
      progress = _MockProgress();

      logger = _MockLogger();
      registerFallbackValue('');
      when(() => logger.progress(any())).thenReturn(progress);

      context = _TestHookContext(logger: logger);

      testOverrides = TestOverrides.empty();
    });

    group('sets vars correctly', () {
      test('when licenses are provided', () async {
        context.vars['licenses'] = ['MIT', 'BSD'];

        await pre_gen.preGen(context, testOverrides: testOverrides);

        expect(context.vars['total'], 2);
        expect(
          context.vars['licenses'],
          containsAll([
            allOf(
              containsPair('license', 'MIT'),
              containsPair('identifier', r'$MIT'),
            ),
            allOf(
              containsPair('license', 'BSD'),
              containsPair('identifier', r'$BSD'),
            ),
          ]),
        );
      });

      test('when licenses are downloaded', () async {
        final licenses = ['MIT', 'BSD'];

        final testOverrides = TestOverrides.empty().copyWith(
          downloadLicensesOverride: () async => licenses,
        );

        await pre_gen.preGen(context, testOverrides: testOverrides);

        expect(context.vars['total'], 2);
        expect(
          context.vars['licenses'],
          containsAll([
            allOf(
              containsPair('license', 'MIT'),
              containsPair('identifier', r'$MIT'),
            ),
            allOf(
              containsPair('license', 'BSD'),
              containsPair('identifier', r'$BSD'),
            ),
          ]),
        );
      });

      test('with valid Dart identifiers', () async {
        const name = '     0+.M I-T     ';
        context.vars['licenses'] = [name];

        await pre_gen.preGen(context, testOverrides: testOverrides);

        expect(context.vars['total'], 1);
        expect(
          context.vars['licenses'],
          contains(
            allOf(
              containsPair('license', name),
              containsPair('identifier', r'$0plus_MI_T'),
            ),
          ),
        );
      });
    });

    group('progress', () {
      test('starts with valid message', () async {
        await pre_gen.preGen(context, testOverrides: testOverrides);

        const message =
            '''Starting to download the SPDX license list, this might take some time''';
        verify(() => logger.progress(message)).called(1);
      });

      test('completes when finished downloading', () async {
        await pre_gen.preGen(context, testOverrides: testOverrides);

        verify(() => progress.complete('Found 0 SPDX licenses')).called(1);
      });

      group('is cancelled', () {
        test(
          'when fails to download list throwing $GenerateSpdxLicenseException',
          () async {
            final testOverrides = TestOverrides.empty().copyWith(
              downloadLicensesOverride: () async =>
                  throw const GenerateSpdxLicenseException(
                    'Failed to download the SPDX license list',
                  ),
            );

            await pre_gen.preGen(context, testOverrides: testOverrides);

            verify(() => progress.cancel()).called(1);
          },
        );

        test(
          'when fails to download list throwing an unknown error',
          () async {
            final testOverrides = TestOverrides.empty().copyWith(
              downloadLicensesOverride: () async =>
                  throw Exception('Unknown error'),
            );

            await pre_gen.preGen(context, testOverrides: testOverrides);

            verify(() => progress.cancel()).called(1);
          },
        );
      });
    });

    group('logs', () {
      test(
        'when fails to download list throwing $GenerateSpdxLicenseException',
        () async {
          const message = '''Failed to download the SPDX license list''';
          final testOverrides = TestOverrides.empty().copyWith(
            downloadLicensesOverride: () async =>
                throw const GenerateSpdxLicenseException(message),
          );

          await pre_gen.preGen(context, testOverrides: testOverrides);

          verify(() => context.logger.err(message)).called(1);
        },
      );

      test('when an unknown error is raised', () async {
        const message = '''Failed to download the SPDX license list''';
        final testOverrides = TestOverrides.empty().copyWith(
          downloadLicensesOverride: () async => throw Exception(message),
        );

        await pre_gen.preGen(context, testOverrides: testOverrides);

        verify(
          () => context.logger.err(
            '[spdxlib] An unknown error occurred, received error: $message',
          ),
        ).called(1);
      });
    });
  });
}
