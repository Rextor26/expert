import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rextor_movie/domain/usecases/movie/get_movie_remove_watchlist.dart';
import 'package:rextor_movie/presentation/bloc/movie_detail_byId_bloc.dart';
import 'package:rextor_movie/presentation/bloc/movie_detail_page_state_management.dart';
import 'package:rextor_movie/presentation/bloc/movie_remove_bloc.dart';
import 'package:rextor_movie/presentation/bloc/movie_watchlist_status_bloc.dart';

import '../../common/state_enum.dart';
import '../../domain/usecases/movie/get_movie_detail.dart';
import '../../domain/usecases/movie/get_movie_save_watchlist.dart';
import '../../domain/usecases/movie/get_movie_watchlist_status.dart';
import 'movie_detail_page_event.dart';
import 'movie_insert_watchlist_bloc.dart';

class GetDetaiMovieBloc extends Bloc<MovieDetailEventBloc, MovieDetailState> {
  static const insertWatchListSucces = 'Added to Watchlist';
  static const removeWatchlistSucces = 'Removed from Watchlist';
  final GetMovieDetailState getMovieDetail;
  final GetWatchListStatus getWatchListStatus;
  final SaveWatchlistMovie saveWatchlist;
  final RemovedWatchlist removeWatchlist;


  GetDetaiMovieBloc({
    required this.getMovieDetail,
    required this.getWatchListStatus,
    required this.saveWatchlist,
    required this.removeWatchlist,
  }) : 
  super(MovieDetailState.initial()) {
        on<InsertWatchlistMovie>((movieEvent, stateMovie) async {
      final bloc = await saveWatchlist.execute(movieEvent.movieDetail);

      bloc.fold((fail) {
        stateMovie(state.copyWith(watchlistMessage: fail.message));
      }, (successMessage) {
        stateMovie(state.copyWith(watchlistMessage: successMessage));
      });

      add(WaitingWatchlistStatus(movieEvent.movieDetail.id));
    });
    on<DetailMovieById>((movieEvent, stateMovie) async {
      stateMovie(state.copyWith(state: RequestState.Loading));
      final blocDetail = await getMovieDetail.execute(movieEvent.id);
      blocDetail.fold(
        (fail) async {
          stateMovie(state.copyWith(state: RequestState.Error));
        },
        (moviedetailBloc) async {
          stateMovie(state.copyWith(
            state: RequestState.Loaded,
            movieDetail: moviedetailBloc,
          ));
        },
      );
    });
    on<RemoveWatchlistMovie>((movieEvent, stateMovie) async {
      final bloc = await removeWatchlist.execute(movieEvent.movieDetail);
      bloc.fold((fail) {
        stateMovie(state.copyWith(watchlistMessage: fail.message));
      }, (msg) {
        stateMovie(state.copyWith(watchlistMessage: msg));
      });
      add(WaitingWatchlistStatus(movieEvent.movieDetail.id));
    });
    on<WaitingWatchlistStatus>((movieEvent, stateMovie) async {
      final bloc = await getWatchListStatus.execute(movieEvent.id);
      stateMovie(state.copyWith(isAddedToWatchlist: bloc));
    });
  }
}
