import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rextor_movie/presentation/bloc/series/series_even.dart';
import 'package:rextor_movie/presentation/bloc/series/series_state_management.dart';

import '../../../domain/usecases/series/get_series_watchlist.dart';

class WatchlistSeriesBloc extends Bloc<SeriesEvent, SeriesStateManagement> {
  final GetWatchlistSeries getSeriesWatchlist;
  WatchlistSeriesBloc(this.getSeriesWatchlist) : super(EmptyDataSeries()) {
    on<GetDataSeries>((seriesEvent, stateSeries) async {
      stateSeries(LoadingDataSeries());
      final bloc = await getSeriesWatchlist.execute();
      bloc.fold(
        (fail) {
          stateSeries(ErrorDataSeries(fail.message));
        },
        (msg) {
          stateSeries(LoadedDataSeries(msg));
        },
      );
    });
  }
}
