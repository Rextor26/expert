import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rextor_movie/presentation/bloc/movie_page_state_management.dart';

import '../../domain/usecases/movie/get_movie_recommendations.dart';
import 'movie_page_event.dart';

class RecBlocMovie extends Bloc<MovieBlocEvent, MovieStateManagementBloc> {
  final GetMovieRecommendations recomendationBloc;

  RecBlocMovie(
    this.recomendationBloc,
  ) : super(EmptyDataMovie()) {
    on<GetDataMovieById>((movieEvent, stateMovie) async {
      final id = movieEvent.id;
      stateMovie(LoadingDataMovie());
      final bloc = await recomendationBloc.execute(id);

      bloc.fold(
        (failure) {
          stateMovie(ErrorDataMovie(failure.message));
        },
        (data) {
          stateMovie(LoadedDataMovie(data));
        },
      );
    });
  }
}