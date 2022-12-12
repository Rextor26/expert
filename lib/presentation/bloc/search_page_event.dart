import 'package:equatable/equatable.dart';

abstract class SearchEventState extends Equatable {
  const SearchEventState();
}

class QueryInput extends SearchEventState {
  final String query;
  const QueryInput(this.query);
  @override
  List<Object> get props => [query];
}
