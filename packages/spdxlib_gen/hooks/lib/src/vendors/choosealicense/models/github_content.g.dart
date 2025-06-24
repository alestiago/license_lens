// To parse this JSON data, do
//
//     final githubContent = githubContentFromJson(jsonString);

import 'dart:convert';

List<GithubContent> githubContentFromJson(String str) =>
    List<GithubContent>.from(
      json.decode(str).map((x) => GithubContent.fromJson(x)),
    );

String githubContentToJson(List<GithubContent> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GithubContent {
  Links links;
  String downloadUrl;
  String gitUrl;
  String htmlUrl;
  String name;
  String path;
  String sha;
  int size;
  Type type;
  String url;

  GithubContent({
    required this.links,
    required this.downloadUrl,
    required this.gitUrl,
    required this.htmlUrl,
    required this.name,
    required this.path,
    required this.sha,
    required this.size,
    required this.type,
    required this.url,
  });

  factory GithubContent.fromJson(Map<String, dynamic> json) => GithubContent(
    links: Links.fromJson(json["_links"]),
    downloadUrl: json["download_url"],
    gitUrl: json["git_url"],
    htmlUrl: json["html_url"],
    name: json["name"],
    path: json["path"],
    sha: json["sha"],
    size: json["size"],
    type: typeValues.map[json["type"]]!,
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "_links": links.toJson(),
    "download_url": downloadUrl,
    "git_url": gitUrl,
    "html_url": htmlUrl,
    "name": name,
    "path": path,
    "sha": sha,
    "size": size,
    "type": typeValues.reverse[type],
    "url": url,
  };
}

class Links {
  String git;
  String html;
  String self;

  Links({
    required this.git,
    required this.html,
    required this.self,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    git: json["git"],
    html: json["html"],
    self: json["self"],
  );

  Map<String, dynamic> toJson() => {
    "git": git,
    "html": html,
    "self": self,
  };
}

enum Type { FILE }

final typeValues = EnumValues({"file": Type.FILE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
