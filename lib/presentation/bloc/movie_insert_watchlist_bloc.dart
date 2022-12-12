import 'package:rextor_movie/domain/entities/movie/movie_detail.dart';

import 'movie_detail_page_event.dart';

class InsertWatchlistMovie extends MovieDetailEventBloc {
  final MovieDetail movieDetail;
  const InsertWatchlistMovie(this.movieDetail);
  @override
  List<Object> get props => [movieDetail];
}