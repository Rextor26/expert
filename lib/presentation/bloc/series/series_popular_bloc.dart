// ignore_for_file: camel_case_types

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rextor_movie/domain/usecases/series/get_series_popular.dart';
import 'package:rextor_movie/presentation/bloc/series/series_even.dart';
import 'package:rextor_movie/presentation/bloc/series/series_state_management.dart';


class seriesPopularBloc extends Bloc<SeriesEvent, SeriesStateManagement> {
  final GetPopularSeries seriesblocPopular;

  seriesPopularBloc(this.seriesblocPopular) : super(EmptyDataSeries()) {
    on<GetDataSeries>((seriesEvent, stateSeries) async {
      stateSeries(LoadingDataSeries());
      final bloc = await seriesblocPopular.execute();
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


