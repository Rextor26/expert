import 'package:dartz/dartz.dart';
import 'package:rextor_movie/common/failure.dart';
import 'package:rextor_movie/domain/entities/series/series.dart';
import 'package:rextor_movie/domain/entities/series/series_detail.dart';

abstract class RepositorySeries{
  Future<Either<Failure, SeriesDetail>> getSeriesDetail(int id);
  Future<Either<Failure, List<Series>>> getSeriesToday();
  Future<Either<Failure, List<Series>>> getSeriesOnAir();
  Future<Either<Failure, List<Series>>> getTopRatedSeries();
  Future<Either<Failure, List<Series>>> getPopularSeries();
  Future<Either<Failure, List<Series>>> getSeriesRecommendations(int id);
  Future<Either<Failure, List<Series>>> searchSeries(String query);
  Future<Either<Failure, String>> saveWatchlistSeries(SeriesDetail seriesDetail);
  Future<Either<Failure, String>> removeWatchlistSeries(SeriesDetail seriesDetail);
  Future<bool> isAddedToWatchlistSeries(int id);
  Future<Either<Failure, List<Series>>> getWatchlistSeries();
}