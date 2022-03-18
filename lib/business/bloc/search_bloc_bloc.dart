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
    on<SearchProjectEvent>((event, emit) async {
      if (event is SearchProject) {
        emit(ProjectLoadingState());

        final projectsList =
            await projectRepository.searchProject(event.projectQuery);

        emit(ProjectLoadedState(projects: projectsList));
      }
    });
  }
}
