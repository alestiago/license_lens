
# Models (choosealicense)

The directory (`packages/spdxlib_gen/hooks/lib/src/vendors/choosealicense/models`) contains automatically generated models.

To understand where each file comes from refer to the ["Files"](#files) section.

## Tooling

The tooling used to automatically generate the models:

- Dart SDK
    - `Dart SDK version: 3.8.1 (stable) (Wed May 28 00:47:25 2025 -0700) on "macos_arm64"`
- [quicktype](https://github.com/glideapps/quicktype)
    - `quicktype version 23.2.6`

## Files

### license_rules.example.json

Unmodified copy from https://github.com/github/choosealicense.com/blob/gh-pages/_licenses/mit.txt (Accessed 24 June 2025).

### license_rules.schema.json

Originally generated using the following command:

```
quicktype -l schema -s json -o license_rules.schema.json license_rules.example.json
```

Then, manually modified to better reflect the actual schema. Manual modification is required since
`quicktype` approximates the schema from the given example. However, the example is limited and
it can't provide the entire context (for example, knowing which fields are nullable).

### license_rules.g.dart

Unmodifed automatically generated file.

It was generated using the following command:
```
quicktype -l dart -s schema -o license_rules.dart license_rules.schema.json &&
mv license_rules.dart license_rules.g.dart &&
dart format license_rules.g.dart
```

### rules.json

Unmodified copy from https://github.com/github/choosealicense.com/blob/gh-pages/_data/rules.yml` (Accessed 24 June 2025).

### rules.g.dart

Unmodifed automatically generated file.

It was generated using the following command:
```
quicktype -l dart -s json -o rules.dart rules.json &&
mv rules.dart rules.g.dart &&
dart format rules.g.dart
```

### github_content.example.json

Unmodified copy from https://api.github.com/repos/github/choosealicense.com/contents/_licenses (Accessed 24 June 2025).

### github_content.schema.json

Unmodifed automatically generated file.

It was generated using the following command:
```
quicktype -l schema -s json -o github_content.schema.json github_content.example.json
```

### github_content.g.dart

Unmodifed automatically generated file.

It was generated using the following command:
```
quicktype -l dart -s schema -o github_content.dart github_content.schema.json &&
mv github_content.dart github_content.g.dart &&
dart format github_content.g.dart
```