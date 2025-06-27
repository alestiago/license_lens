// To parse this JSON data, do
//
//     final rules = rulesFromJson(jsonString);

import 'dart:convert';

Rules rulesFromJson(String str) => Rules.fromJson(json.decode(str));

String rulesToJson(Rules data) => json.encode(data.toJson());

class Rules {
  List<Ion> permissions;
  List<Ion> conditions;
  List<Ion> limitations;

  Rules({
    required this.permissions,
    required this.conditions,
    required this.limitations,
  });

  factory Rules.fromJson(Map<String, dynamic> json) => Rules(
    permissions: List<Ion>.from(
      json["permissions"].map((x) => Ion.fromJson(x)),
    ),
    conditions: List<Ion>.from(json["conditions"].map((x) => Ion.fromJson(x))),
    limitations: List<Ion>.from(
      json["limitations"].map((x) => Ion.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "permissions": List<dynamic>.from(permissions.map((x) => x.toJson())),
    "conditions": List<dynamic>.from(conditions.map((x) => x.toJson())),
    "limitations": List<dynamic>.from(limitations.map((x) => x.toJson())),
  };
}

class Ion {
  String description;
  String label;
  String tag;

  Ion({
    required this.description,
    required this.label,
    required this.tag,
  });

  factory Ion.fromJson(Map<String, dynamic> json) => Ion(
    description: json["description"],
    label: json["label"],
    tag: json["tag"],
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "label": label,
    "tag": tag,
  };
}
