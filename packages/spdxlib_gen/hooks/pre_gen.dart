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

/// A generator that creates the SPDX License enumeration.
///
/// For more information, see the `README.md`.
library;

import 'dart:convert';
import 'dart:io';

import 'package:mason/mason.dart';
import 'package:spdxlib_hooks/spdxlib.dart';

/// Whether the pre-gen hook is running in debug mode.
///
/// In debug mode, the hook will not overwrite existing context variables
/// and will save the context variables to a file for inspection.
///
/// This is useful for development and testing purposes, but should be
/// set to `false` in production to ensure the hook runs as expected.
///
/// Since [preGen] fetches network resources, it is recommended to
/// run this hook in debug mode only when necessary, as it may slow down
/// the generation process or overwhelm the network with requests.
const _kDebugMode = false;

/// {@macro pre_gen}
Future<void> run(HookContext context) async {
  if (_kDebugMode && context.vars.isNotEmpty) {
    // If we're in debug mode and the context already has injected variables,
    // we skip the pre-gen hook to avoid overwriting them.
    return;
  }

  await preGen(context);

  if (_kDebugMode) {
    // In debug mode, we save the context variables to a file for inspection.
    final file = File('config.json');
    await file.writeAsString(jsonEncode(context.vars));
  }
}
