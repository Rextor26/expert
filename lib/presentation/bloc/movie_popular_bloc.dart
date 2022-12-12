import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rextor_movie/domain/usecases/movie/get_movie_popular.dart';
import 'package:rextor_movie/presentation/bloc/movie_page_event.dart';

import 'movie_data_bloc.dart';
import 'movie_page_state_management.dart';

class PopularMovieBloc extends Bloc<MovieBlocEvent, MovieStateManagementBloc> {
  final GetPopularMovies popularMovieBloc;
  PopularMovieBloc(this.popularMovieBloc) : super(EmptyDataMovie()) {
    on<GetDataMovieBloc>((movieEvent, stateMovie) async {
      stateMovie(LoadingDataMovie());
      final bloc = await popularMovieBloc.execute();

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