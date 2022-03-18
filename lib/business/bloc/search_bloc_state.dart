part of 'search_bloc_bloc.dart';

abstract class SearchBlocState extends Equatable {
  const SearchBlocState();

  @override
  List<Object> get props => [];
}

class ProjectEmptyState extends SearchBlocState {}

class ProjectLoadingState extends SearchBlocState {}

class ProjectLoadedState extends SearchBlocState {
  final List<ProjectModel> projects;

  const ProjectLoadedState({required this.projects});

  @override
  List<Object> get props => [projects];
}

class ProjectErrorState extends SearchBlocState {}
