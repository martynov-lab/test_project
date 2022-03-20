part of 'search_bloc_bloc.dart';

abstract class SearchBlocState extends Equatable {
  const SearchBlocState();

  @override
  List<Object> get props => [];
}

class ProjectEmptyState extends SearchBlocState {}

class ProjectLoadingState extends SearchBlocState {}

class ProjectLoadedState extends SearchBlocState {
  final List<ProjectModel> projectsList;

  const ProjectLoadedState({required this.projectsList});

  @override
  List<Object> get props => [projectsList];
}

class ProjectErrorState extends SearchBlocState {
  final String message;

  const ProjectErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
