import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rextor_movie/domain/usecases/series/get_series_on_air.dart';
import 'package:rextor_movie/presentation/bloc/series/series_even.dart';
import 'package:rextor_movie/presentation/bloc/series/series_state_management.dart';

class SeriesOnAirBloc extends Bloc<SeriesEvent, SeriesStateManagement> {
  final GetSeriesOnAir seriesOnAirBloc;
  SeriesOnAirBloc(this.seriesOnAirBloc) : super(EmptyDataSeries()) {
    on<GetDataSeries>((seriesEvent, stateSeries) async {
      stateSeries(LoadingDataSeries());
      final bloc = await seriesOnAirBloc.execute();

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
