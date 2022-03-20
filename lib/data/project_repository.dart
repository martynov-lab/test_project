import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/project_model.dart';
import '../utils/exeption.dart';

class ProjectRepository {
  Future<List<ProjectModel>> searchProject(
      String query, int page, int limit) async {
    var url = Uri.parse(
        "https://api.github.com/search/repositories?q=$query&page=$page&per_page=$limit");
    var respons =
        await http.get(url, headers: {'Content-Type': 'application/json'});
    if (respons.statusCode == 200) {
      final projectsData = json.decode(respons.body);

      final items = projectsData["items"];
      List<ProjectModel> projects = [];
      for (var item in items) {
        final project = ProjectModel.fromJson(item);
        projects.add(project);
      }
      return projects;

      // return (projects['items'] as List)
      //     .map((project) => ProjectModel.fromJson(project))
      //     .toList();
    } else {
      throw ServerExeption();
    }
  }

  // Future<int> getTotalCount(String query, int page, int limit) async {
  //   var url = Uri.parse(
  //       "https://api.github.com/search/repositories?q=$query&page=$page&per_page=$limit");
  //   var respons =
  //       await http.get(url, headers: {'Content-Type': 'application/json'});
  //   if (respons.statusCode == 200) {
  //     final coutData = json.decode(respons.body);
  //     final count = coutData['total_count'];
  //     return count;
  //   } else {
  //     throw ServerExeption();
  //   }
  // }
}
