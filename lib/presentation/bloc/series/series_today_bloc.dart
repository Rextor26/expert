import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rextor_movie/presentation/bloc/series/series_even.dart';
import 'package:rextor_movie/presentation/bloc/series/series_state_management.dart';

import '../../../domain/usecases/series/get_series_today.dart';

class SeriesTodayBloc extends Bloc<SeriesEvent, SeriesStateManagement> {
  final GetSeriesToday seriesTodayBloc;
  SeriesTodayBloc(this.seriesTodayBloc) : super(EmptyDataSeries()) {
    on<GetDataSeries>((seriesEvent, stateSeries) async {
      stateSeries(LoadingDataSeries());
      final result = await seriesTodayBloc.execute();
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