import 'package:dartz/dartz.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:rextor_movie/common/failure.dart';
import 'package:rextor_movie/domain/usecases/series/get_series_on_air.dart';
import 'package:rextor_movie/presentation/bloc/series/series_even.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rextor_movie/presentation/bloc/series/series_on_air.dart';
import 'package:rextor_movie/presentation/bloc/series/series_state_management.dart';
import '../../dummy_data/dummy_objects.dart';
import 'series_list_bloc.mocks.dart';

@GenerateMocks([GetSeriesOnAir])
void main() {
  late MockGetSeriesOnTheAir mockGetOnAirSeries;
  late SeriesOnAirBloc notifier;

  setUp(() {
    mockGetOnAirSeries = MockGetSeriesOnTheAir();
    notifier = SeriesOnAirBloc(mockGetOnAirSeries);
  });


  test('initial state should be empty', () {
    expect(notifier.state, EmptyDataSeries());
  });


    blocTest<SeriesOnAirBloc, SeriesStateManagement>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetOnAirSeries.execute())
          .thenAnswer((_) async => Right(testSeriesList));
      return notifier;
    },
    act: (bloc) => bloc.add(const GetDataSeries()),
    expect: () => [
      LoadingDataSeries(),
      LoadedDataSeries(testSeriesList),
    ],
    verify: (bloc) {
      verify(mockGetOnAirSeries.execute());
    },
  );

  blocTest<SeriesOnAirBloc, SeriesStateManagement>(
    'Should emit [Loading, Error] when get popular is unsuccessful',
    build: () {
      when(mockGetOnAirSeries.execute())
          // ignore: prefer_const_constructors
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return notifier;
    },
    act: (bloc) => bloc.add(const GetDataSeries()),
    expect: () => [
      LoadingDataSeries(),
      const ErrorDataSeries('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetOnAirSeries.execute());
    },
  );

}
