import 'package:dartz/dartz.dart';
import 'package:rextor_movie/domain/entities/series/series.dart';
import 'package:rextor_movie/domain/usecases/series/get_series_today.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main(){
  late GetSeriesToday getSeriesAiringToday;
  late MockSeriesRepository mockSeriesRepository;
  setUp((){
    mockSeriesRepository = MockSeriesRepository();
    getSeriesAiringToday = GetSeriesToday(mockSeriesRepository);
  });

  final series = <Series>[];
  group('Get Airing Today series', (){
    test('should get list of series from the repository', () async{
      ///arrange
      when(mockSeriesRepository.getSeriesToday()).thenAnswer((_) async=> Right(series));
      ///act
      final result = await getSeriesAiringToday.execute();
      ///assert
      expect(result, Right(series));
    });
  });
}