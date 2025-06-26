# SPDX lib

![Pub Version](https://img.shields.io/pub/v/spdxlib)
![License](https://img.shields.io/github/license/alestiago/license_lens)
![Build Status](https://img.shields.io/github/actions/workflow/status/alestiago/license_lens/spdxlib.yml)

Provides an up-to-date full list of all SPDX licenses as seen in the [SPDX Licenses list](https://spdx.org/licenses/), in Dart.

## Table of Contents

- [Features](#features)
- [Why Use This Library?](#why-use-this-library)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Support](#support)
- [Contributing](#contributing)

## Features

- Provides a complete list of SPDX licenses.
- Includes license rules such as permissions, conditions, and limitations from trusthworthy sources.
- Supports parsing and validation of SPDX license identifiers.
- Easy-to-use API for accessing license details.

## Why Use This Library?

- **Up-to-date**: Always synced with the latest SPDX license list.
- **Comprehensive**: Covers all SPDX licenses with detailed rules.
- **Dart Native**: Designed specifically for Dart developers.
- **Open Source**: Licensed under MIT for maximum flexibility.

## Getting started

### Install

To start using `spdxlib`, follow these steps:

1. Run this command within your Dart project:

```dart
dart pub add spdxlib
```

This will add a line like this to your package's pubspec.yaml (and run an implicit dart pub get):

```yaml
dependencies:
  spdxlib: ^1.0.0
```

2. Now in your Dart code, you can use:
```dart
import 'package:spdxlib/spdxlib.dart';
```

That's it! You're ready to work with SPDX licenses in your Dart project.

### Usage

```dart
import 'package:spdxlib/spdxlib.dart';

void main() {
  // 😎 Simple access for specific SPDX license by its identifier:
  SpdxLicense.$MIT;

  // 👮‍♂️ Access the rules associated with a specific license:
  SpdxLicense.$MIT.rules?.permissions;
  // Output: LicensePermission.commercialUse, LicensePermission.modifications, ...
  SpdxLicense.$MIT.rules?.conditions;
  // Output: LicenseCondition.includeCopyright
  SpdxLicense.$MIT.rules?.limitations;
  // Output: LicenseLimitation.liability, LicenseLimitation.warranty

  // 🪪 Easily evaluate the standard identifier for a specific SPDX license:
  SpdxLicense.$MIT.identifier; // Output: MIT
  SpdxLicense.$BSD_2_Clause.identifier; // Output: BSD-2-Clause

  // ✍️ Parse a string to get the corresponding SPDX license:
  SpdxLicense.parse('MIT'); // Output: SpdxLicense.$MIT
  SpdxLicense.tryParse('not-MIT'); // Output: null

  // 📜 Access the entire list of all SPDX licenses:
  for (final license in SpdxLicense.values) {
    if (license == SpdxLicense.$MIT) {
      // Found the MIT license!
    }
  }
}

```

## Community

### Support

If you encounter any issues, please open an [issue](https://github.com/alestiago/license_lens/issues).

### Contributing

We welcome contributions! Please see the [Contributing Guide](https://github.com/alestiago/license_lens/blob/main/packages/spdxlib_gen/CONTRIBUTING.md) for details on how to get started.

## License

This project is licensed under the MIT License. You can read the full license text in the [LICENSE](./LICENSE) file.

For additional information about third-party licenses and acknowledgments, please refer to the [NOTICE.md](./NOTICE.md) file.

