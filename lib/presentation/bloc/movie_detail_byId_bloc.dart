// ignore_for_file: file_names

import 'package:rextor_movie/presentation/bloc/movie_detail_page_event.dart';

class DetailMovieById extends MovieDetailEventBloc {
  final int id;
  const DetailMovieById(this.id);
  @override
  List<Object> get props => [id];
}