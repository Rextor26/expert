import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rextor_movie/domain/usecases/movie/get_movie_watchlist.dart';
import 'package:rextor_movie/presentation/bloc/movie_data_bloc.dart';
import 'package:rextor_movie/presentation/bloc/movie_page_state_management.dart';

import 'movie_page_event.dart';

class WatchlistMovieBloc extends Bloc<MovieBlocEvent, MovieStateManagementBloc> {
  final GetWatchlistMovies watchlistMovieBloc;
  WatchlistMovieBloc(this.watchlistMovieBloc) : super(EmptyDataMovie()) {
    on<GetDataMovieBloc>((movieEvent, stateMovie) async {
      stateMovie(LoadingDataMovie());
      final bloc = await watchlistMovieBloc.execute();

      bloc.fold(
        (fail) {
          stateMovie(ErrorDataMovie(fail.message));
        },
        (msg) {
          stateMovie(LoadedDataMovie(msg));
        },
      );
    });
  }
}