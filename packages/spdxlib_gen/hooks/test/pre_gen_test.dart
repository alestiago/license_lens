import 'package:mason/mason.dart';
import 'package:spdxlib_hooks/src/pre_gen/pre_gen.dart' as pre_gen;
import 'package:test/test.dart';

class _TestHookContext implements HookContext {
  _TestHookContext({required Logger logger}) : _logger = logger;

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
      () async {
        final logger = Logger();
        final context = _TestHookContext(logger: logger);

        pre_gen.downloadLicensesOverride = () async => ['MIT', 'BSD'];

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
