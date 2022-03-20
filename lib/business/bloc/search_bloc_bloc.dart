import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/project_repository.dart';
import '../../models/project_model.dart';

part 'search_bloc_event.dart';
part 'search_bloc_state.dart';

class SearchBlocBloc extends Bloc<SearchProjectEvent, SearchBlocState> {
  final ProjectRepository projectRepository;
  SearchBlocBloc({required this.projectRepository})
      : super(ProjectEmptyState()) {
    on<SearchProject>((event, emit) async {
      emit(ProjectLoadingState());

      try {
        var _loadedProjects = <ProjectModel>[];
        _loadedProjects = await projectRepository.searchProject(
            event.query, event.page, event.limit);
        emit(ProjectLoadedState(projectsList: _loadedProjects));
      } catch (e) {
        emit(ProjectErrorState(message: '$e'));
      }
    });
  }
}
