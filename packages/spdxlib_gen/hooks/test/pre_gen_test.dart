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
import 'package:test/test.dart';

import '../pre_gen.dart' as pre_gen;
import 'test_tag.dart';

class _FakeHookContext implements HookContext {
  _FakeHookContext({required Logger logger}) : _logger = logger;

  final Logger _logger;

  @override
  Map<String, dynamic> vars = {};

  @override
  Logger get logger => _logger;
}

void main() {
  group('run', () {
    test(
      'sets vars correctly',
      tags: [TestTag.ci],
      () async {
        final logger = Logger();
        final context = _FakeHookContext(logger: logger);

        await pre_gen.run(context);

        expect(context.vars['total'], greaterThan(0));
        expect(
          (context.vars['licenses'] as List).length,
          equals(context.vars['total']),
        );
      },
    );
  });
}
