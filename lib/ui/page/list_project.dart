import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/models/project_model.dart';
import '../../business/bloc/search_bloc_bloc.dart';
import 'git_hub_view.dart';

class ListProject extends StatelessWidget {
  const ListProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget textInfo(String name, String value) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[900],
                  fontWeight: FontWeight.w400)),
          Text(value,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w300)),
        ],
      );
    }

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
        projectList = state.projectsList;
      }
      if (state is ProjectErrorState) {
        return const Center(
          child: Text(
            'Nothing found...',
            style: TextStyle(fontSize: 20.0),
          ),
        );
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
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Image.network(projectList[index].avatar),
                          ),
                          Expanded(
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(projectList[index].name,
                                      softWrap: false,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  textInfo('Автор: ', projectList[index].login),
                                  textInfo('Просмотров: ',
                                      "${projectList[index].watchersCount}"),
                                  textInfo('Звезд: ',
                                      "${projectList[index].stargazersCount}"),
                                ],
                              ),
                            ),
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
