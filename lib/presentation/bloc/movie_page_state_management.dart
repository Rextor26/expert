import 'package:equatable/equatable.dart';
import 'package:rextor_movie/domain/entities/movie/movie.dart';

abstract class MovieStateManagementBloc extends Equatable {
  const MovieStateManagementBloc();

  @override
  List<Object> get props => [];
}
class ErrorDataMovie extends MovieStateManagementBloc {
  final String message;

  const ErrorDataMovie(this.message);

  @override
  List<Object> get props => [message];
}

class LoadedDataMovie extends MovieStateManagementBloc {
  final List<Movie> result;

  const LoadedDataMovie(this.result);

  @override
  List<Object> get props => [result];
}

class EmptyDataMovie extends MovieStateManagementBloc {}

class LoadingDataMovie extends MovieStateManagementBloc {}

