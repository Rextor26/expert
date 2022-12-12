import 'package:equatable/equatable.dart';

abstract class SearchEventSeries extends Equatable {
  const SearchEventSeries();

  @override
  List<Object> get props => [];
}

class QueryInputSeries extends SearchEventSeries {
  final String query;

  const QueryInputSeries(this.query);

  @override
  List<Object> get props => [query];
}
