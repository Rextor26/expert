import 'package:equatable/equatable.dart';

abstract class MovieBlocEvent extends Equatable {
  const MovieBlocEvent();
}
class GetDataMovieById extends MovieBlocEvent {
  final int id;
  const GetDataMovieById(this.id);

  @override
  List<Object> get props => [id];
}
