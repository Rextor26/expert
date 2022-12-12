import 'package:rextor_movie/presentation/bloc/movie_detail_page_event.dart';

class WaitingWatchlistStatus extends MovieDetailEventBloc {
  final int id;
  const WaitingWatchlistStatus(this.id);

  @override
  List<Object> get props => [id];
}
