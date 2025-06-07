# SPDX License

Provides up-to-date SPDX license information and utilities, as seen in the [SPDX Licenses list](https://spdx.org/licenses/), in Dart.

## Usage

```dart
import 'package:spdx_license/spdx_license.dart';

void main() {
  // Simple access for specific SPDX license by its identifier:
  SpdxLicense.$MIT;

  // Easily evaluate the standard identifier for a specific SPDX license:
  SpdxLicense.$MIT.identifier; // Output: MIT
  SpdxLicense.$BSD_2_Clause.identifier; // Output: BSD-2-Clause

  // Parse a string to get the corresponding SPDX license:
  SpdxLicense.parse('MIT'); // Output: SpdxLicense.$MIT
  SpdxLicense.tryParse('not-MIT'); // Output: null

  // Access the entire list of all SPDX licenses:
  for (final license in SpdxLicense.values) {
    if (license == SpdxLicense.$MIT) {
      // Found the MIT license!
    }
  }
}

```