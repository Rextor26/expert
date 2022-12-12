import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rextor_movie/domain/usecases/movie/get_movie_now_playing.dart';
import 'package:rextor_movie/presentation/bloc/movie_page_event.dart';
import 'package:rextor_movie/presentation/bloc/movie_page_state_management.dart';

import 'movie_data_bloc.dart';


class MovieBloc extends Bloc<MovieBlocEvent, MovieStateManagementBloc> {
  final GetNowPlayingMovies nowPlayingMovieBloc;

  MovieBloc(this.nowPlayingMovieBloc) : super(EmptyDataMovie()) {
    on<GetDataMovieBloc>((movieEvent, stateMovie) async {
      stateMovie(LoadingDataMovie());
      final bloc = await nowPlayingMovieBloc.execute();

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

