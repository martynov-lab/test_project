part of 'search_bloc_bloc.dart';


abstract class SearchProjectEvent extends Equatable{
    const SearchProjectEvent();

  @override
  List<Object> get props => [];
}

class SearchProject extends SearchProjectEvent {
    final String projectQuery;

  const SearchProject(this.projectQuery);
}