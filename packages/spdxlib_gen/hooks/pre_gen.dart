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

import 'package:mason/mason.dart';
import 'package:spdxlib_hooks/spdxlib.dart';

/// {@macro pre_gen}
Future<void> run(HookContext context) async => preGen(context);
