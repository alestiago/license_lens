# SPDX lib

![Pub Version](https://img.shields.io/pub/v/spdxlib)
![License](https://img.shields.io/github/license/alestiago/license_lens)
![Build Status](https://img.shields.io/github/actions/workflow/status/alestiago/license_lens/spdxlib.yml)

Provides an up-to-date full list of all SPDX licenses as seen in the [SPDX Licenses list](https://spdx.org/licenses/), in Dart.

## Table of Contents

- [Features](#features)
- [Quick start](#quick-start-)
  - [Installing](#installing-)
  - [Usage](#usage-)
- [Project Resources](#project-resources)
  - [Support](#support)
  - [Contributing](#contributing)
  - [License](#license)
  - [Maintainers](#maintainers)

## Features

- 📜 **Comprehensive License Coverage**: Access an up-to-date and auto-sycned list of official SPDX licenses.
- 🔍 **Detailed License Rules**: View permissions, conditions, and limitations for each license - sourced from trusted repositories.
- 🛠️ **Developer-Friendly API**: Clear and consistent methods for managing license data.

## Quick Start 🚀

### Installing 🧑‍💻

```dart
dart pub add spdxlib
```

Now in your Dart code, you can use:

```dart
import 'package:spdxlib/spdxlib.dart';
```

💡 **Note**: For full installation instructions refer to [spdxlib install](https://pub.dev/packages/spdxlib/install).

### Usage ✨

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

## Project Resources

### Support

If you encounter any issues, please open an [issue](https://github.com/alestiago/license_lens/issues).

### Contributing

We welcome contributions! Please see the [Contributing Guide](https://github.com/alestiago/license_lens/blob/main/packages/spdxlib_gen/CONTRIBUTING.md) for details on how to get started.

### License

This project is licensed under the MIT License. You can read the full license text in the [LICENSE](./LICENSE) file.

For additional information about third-party licenses and acknowledgments, please refer to the [NOTICE.md](./NOTICE.md) file.

### Maintainers

- [Alejandro Santiago](https://github.com/alestiago)

