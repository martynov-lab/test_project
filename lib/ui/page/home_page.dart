import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/ui/widgets/form_search.dart';

import '../../business/bloc/search_bloc_bloc.dart';
import '../../data/project_repository.dart';
import 'list_project.dart';

class HomePage extends StatelessWidget {
  final projectRepository = ProjectRepository();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.view_headline))
        ],
        title: const Text('Github Project'),
        centerTitle: true,
      ),
      body: BlocProvider<SearchBlocBloc>(
        create: (context) =>
            SearchBlocBloc(projectRepository: projectRepository),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              FormSearch(),
              Expanded(child: ListProject()),
            ],
          ),
        ),
      ),
    );
  }
}
