import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rextor_movie/common/state_enum.dart';
import 'package:rextor_movie/domain/usecases/series/get_series_detail.dart';
import 'package:rextor_movie/domain/usecases/series/get_series_remove_series_watchlist.dart';
import 'package:rextor_movie/domain/usecases/series/get_series_save_watchlist.dart';
import 'package:rextor_movie/domain/usecases/series/get_series_watchlist_status.dart';
import 'package:rextor_movie/presentation/bloc/series/series_detail_event.dart';
import 'package:rextor_movie/presentation/bloc/series/series_detail_state_management.dart';



class SeriesDetailBloc
  extends Bloc<SeriesDetailEvent, SeriesDetailState> {
  final GetSeriesDetail seriesDetailbloc;
  final GetWatchlistStatusSeries getSeriesWatchListStatus;
  final SaveWatchlistSeries saveWatchlist;
  final RemoveWatchlistSeries removeWatchlist;

  static const insertWatchListSucces = 'Added to Watchlist';
  static const removeWatchlistSucces = 'Removed from Watchlist';

  SeriesDetailBloc({
    required this.seriesDetailbloc,
    required this.getSeriesWatchListStatus,
    required this.saveWatchlist,
    required this.removeWatchlist,
  }) : super(SeriesDetailState.initial()) {
    on<FetchSeriesDetailById>((event, emit) async {
      emit(state.copyWith(state: RequestState.Loading));
      final blocDetail = await seriesDetailbloc.execute(event.id);

      blocDetail.fold(
        (failure) async {
          emit(state.copyWith(state: RequestState.Error));
        },
        (tvseries) async {
          emit(state.copyWith(
            tvseriesDetail: tvseries,
            state: RequestState.Loaded,
          ));
        },
      );
    });
    on<AddWatchlistSeries>((event, emit) async {
      final result = await saveWatchlist.execute(event.seriesDetail);

      result.fold((failure) {
        emit(state.copyWith(watchlistMessage: failure.message));
      }, (successMessage) {
        emit(state.copyWith(watchlistMessage: successMessage));
      });

      add(WaitingWatchlistStatus(event.seriesDetail.id));
    });
    on<RemoveSeriesWatchlist>((event, emit) async {
      final result = await removeWatchlist.execute(event.seriesDetail);

      result.fold((failure) {
        emit(state.copyWith(watchlistMessage: failure.message));
      }, (successMessage) {
        emit(state.copyWith(watchlistMessage: successMessage));
      });

      add(WaitingWatchlistStatus(event.seriesDetail.id));
    });
    on<WaitingWatchlistStatus>((event, emit) async {
      final result = await getSeriesWatchListStatus.execute(event.id);
      emit(state.copyWith(isAddedToWatchlist: result));
    });
  }
}
