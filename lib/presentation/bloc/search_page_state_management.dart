import 'package:equatable/equatable.dart';
import '../../domain/entities/movie/movie.dart';

abstract class SearchStateMovie extends Equatable {
  const SearchStateMovie();

  @override
  List<Object> get props => [];
}

class SearchMovieEmpty extends SearchStateMovie {}

class SearchMovieLoading extends SearchStateMovie {}

class SearchMovieError extends SearchStateMovie {
  final String message;

  const SearchMovieError(this.message);

  @override
  List<Object> get props => [message];
}

class SearchMovieHasData extends SearchStateMovie {
  final List<Movie> result;
  const SearchMovieHasData(this.result);
  @override
  List<Object> get props => [result];
}
