part of 'search_bloc_bloc.dart';

abstract class SearchProjectEvent extends Equatable {
  const SearchProjectEvent();

  @override
  List<Object> get props => [];
}

class SearchProject extends SearchProjectEvent {
  final String query;
  final int page;
  final int limit;

  const SearchProject(
      {required this.query, required this.page, required this.limit});
}
