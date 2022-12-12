
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rextor_movie/presentation/bloc/series/series_even.dart';
import 'package:rextor_movie/presentation/bloc/series/series_state_management.dart';

import '../../../domain/usecases/series/get_series_recommendation.dart';

class SeriesRecomendationBloc extends Bloc<SeriesEvent, SeriesStateManagement> {
  final GetSeriesRecommendations seriesRecomendationBloc;

  SeriesRecomendationBloc(
    this.seriesRecomendationBloc,
  ) : super(EmptyDataSeries()) {
    on<GetDataSeriesWithId>((seriesEvent, stateSeries) async {
      final id = seriesEvent.id;
      stateSeries(LoadingDataSeries());
      final result = await seriesRecomendationBloc.execute(id);

      result.fold(
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