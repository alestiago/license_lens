// To parse this JSON data, do
//
//     final licenseRules = licenseRulesFromJson(jsonString);

import 'dart:convert';

LicenseRules licenseRulesFromJson(String str) =>
    LicenseRules.fromJson(json.decode(str));

String licenseRulesToJson(LicenseRules data) => json.encode(data.toJson());

class LicenseRules {
  List<String>? conditions;
  String? description;
  bool? featured;
  bool? hidden;
  String? how;
  List<String>? limitations;
  List<String>? permissions;
  String spdxId;
  String? title;
  Using? using;

  LicenseRules({
    this.conditions,
    this.description,
    this.featured,
    this.hidden,
    this.how,
    this.limitations,
    this.permissions,
    required this.spdxId,
    this.title,
    this.using,
  });

  factory LicenseRules.fromJson(Map<String, dynamic> json) => LicenseRules(
    conditions: json["conditions"] == null
        ? []
        : List<String>.from(json["conditions"]!.map((x) => x)),
    description: json["description"],
    featured: json["featured"],
    hidden: json["hidden"],
    how: json["how"],
    limitations: json["limitations"] == null
        ? []
        : List<String>.from(json["limitations"]!.map((x) => x)),
    permissions: json["permissions"] == null
        ? []
        : List<String>.from(json["permissions"]!.map((x) => x)),
    spdxId: json["spdx-id"],
    title: json["title"],
    using: json["using"] == null ? null : Using.fromJson(json["using"]),
  );

  Map<String, dynamic> toJson() => {
    "conditions": conditions == null
        ? []
        : List<dynamic>.from(conditions!.map((x) => x)),
    "description": description,
    "featured": featured,
    "hidden": hidden,
    "how": how,
    "limitations": limitations == null
        ? []
        : List<dynamic>.from(limitations!.map((x) => x)),
    "permissions": permissions == null
        ? []
        : List<dynamic>.from(permissions!.map((x) => x)),
    "spdx-id": spdxId,
    "title": title,
    "using": using?.toJson(),
  };
}

class Using {
  Using();

  factory Using.fromJson(Map<String, dynamic> json) => Using();

  Map<String, dynamic> toJson() => {};
}
