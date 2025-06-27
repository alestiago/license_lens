# SPDX lib brick

A generator that provides a Dart SPDX License enumeration from a list of SPDX licenses.

This package should always match [PANA's](https://github.com/dart-lang/pana/blob/master/third_party/spdx/update_licenses.dart) license list; currently the list is deduced from the [SPDX GitHub repository](https://github.com/spdx/license-list-data/tree/main/json/details).

💡 **Note**: The SPDX License brick is not published at [Brick Hub](brickhub.dev). It is not intended to be used by the general public.

## Usage

1. Install a valid [Dart SDK](https://dart.dev/get-dart) in your local environment. Compatible Dart SDK versions with the SPDX license brick can be found within the environment Dart dependency in the [pubspec.yaml](./hooks/pubspec.yaml). If you have Flutter installed you likely have a valid Dart SDK version already installed.

2. Install [Mason](https://github.com/felangel/mason/tree/master/packages/mason_cli#installation) in your local environment:

```sh
# 🎯 Activate from https://pub.dev
dart pub global activate mason_cli
```

3. Get all Mason bricks:

```sh
# 🗂 Gets all bricks in the nearest mason.yaml (from project root)
mason get
```

4. Generate a Dart SPDX License enumeration:

```sh
# ⚙️ Generate code using the spdxlib brick (from within project)
mason make spdxlib -o lib/src/ --on-conflict=overwrite
```

