// Example file demonstrating how to use the package:spdx_license.
// ignore_for_file: unnecessary_statements

import 'package:spdx_license/spdx_license.dart';

void main() {
  // Simple access for specific SPDX license by its identifier:
  SpdxLicense.$MIT;

  // Easily evaluate the standard name for a specific SPDX license:
  SpdxLicense.$MIT.value; // Output: MIT
  SpdxLicense.$BSD_2_Clause.value; // Output: BSD-2-Clause

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
