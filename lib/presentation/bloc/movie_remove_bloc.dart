import 'package:rextor_movie/domain/entities/movie/movie_detail.dart';
import 'package:rextor_movie/presentation/bloc/movie_detail_page_event.dart';

class RemoveWatchlistMovie extends MovieDetailEventBloc {
  final MovieDetail movieDetail;
  const RemoveWatchlistMovie(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}