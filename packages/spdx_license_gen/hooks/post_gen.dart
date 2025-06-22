// Copyright (c) 2025 Alejandro Santiago
//
// This file is part of spdx_license_gen and is distributed under the terms of
// the MIT License.
//
// For complete licensing information, please refer to the README file:
// https://github.com/alestiago/license_lens/blob/main/packages/spdx_license_gen/LICENSE
//
// Full attribution information is provided in the NOTICE file:
// https://github.com/alestiago/license_lens/blob/main/packages/spdx_license_gen/NOTICE.md

import 'dart:io';
import 'package:mason/mason.dart';
import 'package:meta/meta.dart';

typedef ProcessRun =
    Future<ProcessResult> Function(
      String command,
      List<String> args, {
      bool runInShell,
      String workingDirectory,
    });

@visibleForTesting
ProcessRun? processOverride;

Future<void> run(HookContext context) async {
  final runProcess = processOverride ?? Process.run;

  final progress = context.logger.progress('Formatting files');

  await runProcess(
    'dart',
    ['format', '.'],
    workingDirectory: Directory.current.path,
    runInShell: true,
  );

  progress.complete();
}
