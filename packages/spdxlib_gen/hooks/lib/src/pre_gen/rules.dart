part of 'pre_gen.dart';

Future<MasonContextVariables> _rulesVariables(HookContext context) async {
  final rules = await _downloadRules(logger: context.logger);
  return {ContextVariables.rules.name: rules.toJson()};
}

Future<Rules> _downloadRules({
  required Logger logger,
}) async {
  final progress = logger.progress(
    'Starting to download the ChooseALicense rules, this might take some time',
  );

  late Rules rules;
  try {
    rules =
        await (downloadRulesOverride?.call() ?? downloadRules(client: _client));
  } on ChooseALicenseException catch (e) {
    progress.cancel();
    logger.err(e.toString());
    _exit(ExitCode.unavailable.code);
  } on Object {
    rethrow;
  }

  progress.complete(
    'Downloaded ${rules.permissions.length} permissions, '
    '${rules.conditions.length} conditions, and '
    '${rules.limitations.length} limitations',
  );
  return rules;
}
