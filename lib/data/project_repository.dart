import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/project_model.dart';
import '../utils/exeption.dart';

class ProjectRepository {
  Future<List<ProjectModel>> searchProject(String query) async {
    var url = Uri.parse("https://api.github.com/search/repositories?q=$query");
    var respons =
        await http.get(url, headers: {'Content-Type': 'application/json'});
    if (respons.statusCode == 200) {
      final projectsData = json.decode(respons.body);

      //print('${projectsData["items"]}');

      final items = projectsData["items"];
      List<ProjectModel> projects = [];
      for (var item in items) {
        var project = ProjectModel.fromJson(item);
        print('${project.name}');
        projects.add(project);
      }
      //print('$projects');
      return projects;

      // return (projects['items'] as List)
      //     .map((project) => ProjectModel.fromJson(project))
      //     .toList();
    } else {
      throw ServerExeption();
    }
  }
}
