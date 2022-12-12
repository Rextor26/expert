import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rextor_movie/presentation/bloc/movie_data_bloc.dart';

import '../../domain/usecases/movie/get_movie_top_rated.dart';
import 'movie_page_event.dart';
import 'movie_page_state_management.dart';

class TopRatedMovieBloc extends Bloc<MovieBlocEvent, MovieStateManagementBloc> {
  final GetTopRatedMovies topratedMovieBloc;
  TopRatedMovieBloc(this.topratedMovieBloc) : super(EmptyDataMovie()) {
    on<GetDataMovieBloc>((movieEvent, stateMovie) async {
      stateMovie(LoadingDataMovie());
      final bloc = await topratedMovieBloc.execute();

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