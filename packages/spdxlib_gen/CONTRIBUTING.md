## Contributing to the spdxlib brick

First of all, thank you for taking the time to contribute! 🎉👍 Before you do, please carefully read this guide.

## Developing for spdxlib

To develop for spdxlib brick, you will also need to become familiar with our processes and conventions detailed within the mono-repository [CONTRIBUTING](../../CONTRIBUTING.md).

💡 **Note**: The spdxlib brick is not published at [Brick Hub](brickhub.dev).

### Setting up your local development environment

1. Install a valid [Dart SDK](https://dart.dev/get-dart) in your local environment. Compatible Dart SDK versions with the spdxlib brick can be found within the [hooks pubspec](hooks/pubspec.yaml). If you have Flutter installed you likely have a valid Dart SDK version already installed.

2. Install [Mason](https://github.com/felangel/mason/tree/master/packages/mason_cli#installation) in your local environment:

```sh
# 🎯 Activate from https://pub.dev
dart pub global activate mason_cli
```

3. Get hooks' dependencies:

```sh
# 🪝 Get hooks' dependencies (from packages/spdxlib_gen/hooks)
dart pub get
```

4. Run all hook's tests:

```sh
# 🧪 Test all hook's (from packages/spdxlib_gen/hooks)
dart test
```

If some tests do not pass out of the box, please submit an [issue](https://github.com/alestiago/license_lens/issues/new/choose).

4. Get all Mason bricks:

```sh
# 🗂 Gets all bricks in the nearest mason.yaml (from project root)
mason get
```

5. Generate a Dart SPDX lib enumeration:

```sh
# ⚙️ Generate code using the spdxlib brick (from project root)
mason make spdxlib -o packages/spdxlib/lib/src/ --on-conflict=overwrite 
```

If the licenses prompt is left empty the brick will fetch the [SPDX list](https://github.com/spdx/license-list-data/tree/main/json/details). Otherwise, the user specified licenses will be used and no SPDX List will be fetched.
