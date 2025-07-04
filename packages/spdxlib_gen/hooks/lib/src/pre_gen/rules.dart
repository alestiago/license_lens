part of 'pre_gen.dart';

Future<MasonContextVariables> _rulesVariables(HookContext context) async {
  final rules = await _downloadRules(
    logger: context.logger,
  );
  return {ContextVariables.rules.name: rules.toJson()};
}

Future<Rules> _downloadRules({
  required Logger logger,
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
    downloadFunction: () async => downloadRules(client: _client),
  );
}
