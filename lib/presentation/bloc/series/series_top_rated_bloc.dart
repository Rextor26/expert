import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rextor_movie/presentation/bloc/series/series_even.dart';
import 'package:rextor_movie/presentation/bloc/series/series_state_management.dart';

import '../../../domain/usecases/series/get_series_top_rated.dart';

class TopratedSeriesBloc extends Bloc<SeriesEvent, SeriesStateManagement> {
  final GetTopRatedSeries topRatedSeriesBloc;
  TopratedSeriesBloc(this.topRatedSeriesBloc) : super(EmptyDataSeries()) {
    on<GetDataSeries>((seriesEvent, stateSeries) async {
      stateSeries(LoadingDataSeries());
      final bloc = await topRatedSeriesBloc.execute();

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
