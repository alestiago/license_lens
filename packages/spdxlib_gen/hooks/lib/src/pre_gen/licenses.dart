part of 'pre_gen.dart';

Future<MasonContextVariables> _licensesVariables(HookContext context) async {
  final licensesVar = context.vars['licenses'];
  final shouldFetchLicenses =
      (licensesVar == null || (licensesVar is List && licensesVar.isEmpty)) &&
      licensesVar is! List<String>;

  late List<String> licenses;
  late AllLicenseRules allLicenseRules;
  if (shouldFetchLicenses) {
    licenses = await _downloadLicenses(
      logger: context.logger,
    );
    allLicenseRules = await _downloadAllLicenseRules(
      logger: context.logger,
    );
  } else {
    if (licensesVar is! List) {
      context.logger.err(
        'The "licenses" variable is not a List or null',
      );
      exit(ExitCode.data.code);
    }
    licenses = licensesVar.map((e) => e.toString()).toList();
    allLicenseRules = {};
  }

  final newLicensesVar = <Map<String, dynamic>>[
    for (final license in licenses)
      {
        'license': license,
        'identifier': license.toDartIdentifier(),
        'hasRules': allLicenseRules.containsKey(license),
        if (allLicenseRules.containsKey(license))
          'rules': {
            'hasPermissions': allLicenseRules[license]!.permissions != null,
            'hasConditions': allLicenseRules[license]!.conditions != null,
            'hasLimitations': allLicenseRules[license]!.limitations != null,
            ...(allLicenseRules[license]!.toJson()),
          },
      },
  ];

  return {
    ContextVariables.licenses.name: newLicensesVar,
    ContextVariables.total.name: newLicensesVar.length,
  };
}

extension on String {
  String toDartIdentifier() {
    return '\$$this'
        .replaceAll('-', '_')
        .replaceAll('.', '_')
        .replaceAll(' ', '')
        .replaceAll('+', 'plus')
        .trim();
  }
}

Future<Licenses> _downloadLicenses({required Logger logger}) async {
  return _downloadWithProgress(
    logger: logger,
    startMessage:
        'Starting to download the SPDX license list, this might take some time',
    completeMessage: (Licenses licenses) =>
        'Found ${licenses.length} SPDX licenses',
    downloadFunction: () async => downloadLicenses(client: _client),
  );
}

Future<AllLicenseRules> _downloadAllLicenseRules({
  required Logger logger,
}) async {
  return _downloadWithProgress(
    logger: logger,
    startMessage:
        'Starting to download the ChooseALicense rules, this might take some '
        'time',
    completeMessage: (AllLicenseRules rules) =>
        'Found ${rules.length} ChooseALicense rules',
    downloadFunction: () async => downloadLicenseRules(client: _client),
  );
}
