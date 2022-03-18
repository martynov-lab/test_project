class ProjectModel {
  final int id;
  final String name;
  final String fullName;
  final int stargazersCount;
  final int watchersCount;
  final String login;
  final String avatar;
  final String urlGitHub;

  ProjectModel({
    required this.id,
    required this.name,
    required this.fullName,
    required this.stargazersCount,
    required this.watchersCount,
    required this.login,
    required this.avatar,
    required this.urlGitHub,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json["id"],
      name: json["name"],
      fullName: json["full_name"],
      stargazersCount: json["stargazers_count"],
      watchersCount: json["watchers_count"],
      login: json['owner']['login'] as String,
      avatar: json['owner']['avatar_url'] as String,
      urlGitHub: json['owner']['url'] as String,
    );
  }
}
