/// Defined tags for tests.
///
/// Use these tags to group tests and run them separately.
///
/// Tags are defined within the `dart_test.yaml` file.
///
/// See also:
///
/// * [Dart Test Configuration documentation](https://github.com/dart-lang/test/blob/master/pkgs/test/doc/configuration.md)
abstract class TestTag {
  /// Should only be run during pull request
  static const e2e = 'pull-request-only';
}
