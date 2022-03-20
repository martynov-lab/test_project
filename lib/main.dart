import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business/bloc/search_bloc_bloc.dart';
import 'data/project_repository.dart';
import 'ui/page/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final projectRepository = ProjectRepository();
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<SearchBlocBloc>(
        create: (context) =>
            SearchBlocBloc(projectRepository: projectRepository),
        child: const HomePage(),
      ),
    );
  }
}
