import 'package:dartz/dartz.dart';
import 'package:rextor_movie/domain/entities/series/series.dart';
import 'package:rextor_movie/domain/usecases/series/get_series_on_air.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetSeriesOnAir usecase;
  late MockSeriesRepository mockSeriesRepository;

  setUp(() {
    mockSeriesRepository = MockSeriesRepository();
    usecase = GetSeriesOnAir(mockSeriesRepository);
  });

  final series = <Series>[];

  group('Get On The Air series', (){
    test('should get list of series from the repository', () async {
    // arrange
      when(mockSeriesRepository.getSeriesOnAir())
          .thenAnswer((_) async => Right(series));
      // act
      final result = await usecase.execute();
      // assert
      expect(result, Right(series));
    });
  });

  
}