part of 'pre_gen.dart';

/// Signature for overriding [downloadRules].
typedef DownloadRules = Future<Rules> Function();

/// Signature for overriding [downloadLicenseRules].
typedef DownloadLicenseRules = Future<AllLicenseRules> Function();

/// Signature for overriding [downloadLicenses].
typedef DownloadLicenses = Future<Licenses> Function();

@visibleForTesting
/// {@template TestOverrides}
/// A class that allows overriding the download functions for testing purposes.
/// {@endtemplate}
class TestOverrides {
  @visibleForTesting
  /// {@macro TestOverrides}
  const TestOverrides(
    this.downloadLicensesOverride,
    this.downloadRulesOverride,
    this.downloadLicenseRulesOverride,
  );

  /// Creates an instance of [TestOverrides] with empty overrides.
  @visibleForTesting
  factory TestOverrides.empty() {
    return TestOverrides(
      () async => [],
      () async => Rules(permissions: [], conditions: [], limitations: []),
      () async => {},
    );
  }

  @visibleForTesting
  /// Allows overriding [downloadLicenses] function for testing purposes.
  final DownloadLicenses? downloadLicensesOverride;

  @visibleForTesting
  /// Allows overriding [downloadRules] function for testing purposes.
  final DownloadRules? downloadRulesOverride;

  @visibleForTesting
  /// Allows overriding [downloadLicenseRules] function for testing purposes.
  final DownloadLicenseRules? downloadLicenseRulesOverride;

  /// Creates a copy of this [TestOverrides] instance with the specified
  /// overrides.
  TestOverrides copyWith({
    DownloadLicenses? downloadLicensesOverride,
    DownloadRules? downloadRulesOverride,
    DownloadLicenseRules? downloadLicenseRulesOverride,
  }) {
    return TestOverrides(
      downloadLicensesOverride ?? this.downloadLicensesOverride,
      downloadRulesOverride ?? this.downloadRulesOverride,
      downloadLicenseRulesOverride ?? this.downloadLicenseRulesOverride,
    );
  }
}
