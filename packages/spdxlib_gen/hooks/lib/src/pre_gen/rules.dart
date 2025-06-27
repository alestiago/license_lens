part of 'pre_gen.dart';

Future<MasonContextVariables> _rulesVariables(
  HookContext context, {
  @visibleForTesting TestOverrides? testOverrides,
}) async {
  final rules = await _downloadRules(
    logger: context.logger,
    testOverrides: testOverrides,
  );
  return {ContextVariables.rules.name: rules.toJson()};
}

Future<Rules> _downloadRules({
  required Logger logger,
  @visibleForTesting TestOverrides? testOverrides,
}) async {
  return _downloadWithProgress(
    logger: logger,
    startMessage:
        'Starting to download the ChooseALicense rules, this might take some '
        'time',
    completeMessage: (Rules rules) =>
        'Downloaded ${rules.permissions.length} permissions, '
        '${rules.conditions.length} conditions, and ${rules.limitations.length}'
        'limitations',
    downloadFunction: () async =>
        testOverrides?.downloadRulesOverride?.call() ??
        downloadRules(client: _client),
  );
}
