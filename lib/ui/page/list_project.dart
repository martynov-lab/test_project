import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/models/project_model.dart';

import '../../business/bloc/search_bloc_bloc.dart';
import 'git_hub_view.dart';

class ListProject extends StatefulWidget {
  const ListProject({Key? key}) : super(key: key);

  @override
  State<ListProject> createState() => _ListProjectState();
}

class _ListProjectState extends State<ListProject> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBlocBloc, SearchBlocState>(
        builder: (context, state) {
      List<ProjectModel> projectList = [];
      if (state is ProjectEmptyState) {
        return const Center(
          child: Text(
            'No data received',
            style: TextStyle(fontSize: 20.0),
          ),
        );
      }
      if (state is ProjectLoadingState) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is ProjectLoadedState) {
        projectList = state.projects;
      }
      return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: projectList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return GitHubView(
                    url: projectList[index].urlGitHub,
                  );
                }),
              ),
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      Text(projectList[index].name,
                          style: const TextStyle(fontSize: 18)),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    '${projectList[index].avatar}')),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Автор: ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.bold)),
                                  Text(projectList[index].login,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[600])),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Просмотров: ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.bold)),
                                  Text("${projectList[index].stargazersCount}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[600])),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Звезд: ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.bold)),
                                  Text("${projectList[index].stargazersCount}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[600])),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    });
  }
}
