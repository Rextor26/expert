import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rextor_movie/presentation/bloc/search_page_event.dart';
import 'package:rextor_movie/presentation/bloc/search_page_state_management.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/usecases/movie/get_movie_search.dart';


class SearchMovieBloc extends Bloc<SearchEventState, SearchStateMovie> {
  final SearchMovies searchMovie;

  SearchMovieBloc(this.searchMovie) : super(SearchMovieEmpty()) {
    on<QueryInput>((movieEvent, stateMovie) async {
      final q = movieEvent.query;

      stateMovie(SearchMovieLoading());
      final bloc = await searchMovie.execute(q);

      bloc.fold(
        (fail) {
          stateMovie(SearchMovieError(fail.message));
        },
        (msg) {
          stateMovie(SearchMovieHasData(msg));
        },
      );
    }, transformer: timer(const Duration(milliseconds: 500)));
  }

  EventTransformer<T> timer<T>(Duration time) {
    return (events, mapper) => events.debounceTime(time).flatMap(mapper);
  }
}
