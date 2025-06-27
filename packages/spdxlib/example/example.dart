// Example file demonstrating how to use the package:spdxlib.
// ignore_for_file: unnecessary_statements, lines_longer_than_80_chars

import 'package:spdxlib/spdxlib.dart';

void main() {
  // 😎 Simple access for specific SPDX license by its identifier:
  SpdxLicense.$MIT;

  // 👮‍♂️ Access the rules associated with a specific license:
  SpdxLicense.$MIT.rules?.permissions;
  // Output: {LicensePermission.commercialUse, LicensePermission.modifications, ...}
  SpdxLicense.$MIT.rules?.conditions;
  // Output: {LicenseCondition.includeCopyright}
  SpdxLicense.$MIT.rules?.limitations;
  // Output: {LicenseLimitation.liability, LicenseLimitation.warranty}

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
