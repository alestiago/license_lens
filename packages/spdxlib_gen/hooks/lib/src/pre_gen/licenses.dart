part of 'pre_gen.dart';

Future<MasonContextVariables> _licensesVariables(HookContext context) async {
  final licensesVar = context.vars['licenses'];
  final shouldFetchLicenses =
      (licensesVar == null || (licensesVar is List && licensesVar.isEmpty)) &&
      licensesVar is! List<String>;

  late List<String> licenses;
  if (shouldFetchLicenses) {
    licenses = await _downloadLicenses(logger: context.logger);
  } else {
    if (licensesVar is! List) {
      context.logger.err(
        'The "licenses" variable is not a List or null',
      );
      exit(ExitCode.data.code);
    }
    licenses = licensesVar.map((e) => e.toString()).toList();
  }

  final newLicensesVar = <Map<String, dynamic>>[
    for (final license in licenses)
      {
        'license': license,
        'identifier': license.toDartIdentifier(),
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

Future<Licenses> _downloadLicenses({
  required Logger logger,
}) async {
  final progress = logger.progress(
    'Starting to download the SPDX license list, this might take some time',
  );

  late Licenses licenses;
  try {
    licenses =
        await (downloadLicensesOverride?.call() ??
            downloadLicenses(client: _client));
  } on GenerateSpdxLicenseException catch (e) {
    progress.cancel();
    logger.err(e.message);
    _exit(ExitCode.unavailable.code);
  } on Object {
    rethrow;
  }

  progress.complete('Found ${licenses.length} SPDX licenses');
  return licenses;
}
