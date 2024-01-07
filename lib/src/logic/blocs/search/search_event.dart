part of 'search_bloc.dart';

class SearchEvent extends Equatable {
  final String searhQuery;

  const SearchEvent({required this.searhQuery});

  @override
  List<Object> get props => [searhQuery];
}
