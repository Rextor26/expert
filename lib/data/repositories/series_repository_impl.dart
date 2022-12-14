


// ignore_for_file: prefer_const_constructors, use_rethrow_when_possible

import 'dart:async';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:rextor_movie/common/exception.dart';
import 'package:rextor_movie/common/failure.dart';
import 'package:rextor_movie/data/datasources/series_local_data_source.dart';
import 'package:rextor_movie/data/datasources/remote_data_source.dart';
import 'package:rextor_movie/data/models/series/series_table.dart';
import 'package:rextor_movie/domain/entities/series/series.dart';
import 'package:rextor_movie/domain/entities/series/series_detail.dart';
import 'package:rextor_movie/domain/repositories/series_repository.dart';

class RepositorySeriesImpl implements RepositorySeries{
  final RemoteDataSource remoteDataSource;

  final SeriesLocalDataSource seriesLocalDataSource;
  RepositorySeriesImpl({
    required this.remoteDataSource,
    required this.seriesLocalDataSource
  });


  @override
  Future<Either<Failure, List<Series>>> searchSeries(String query) async {

    try{
      final result = await remoteDataSource.searchSeries(query);
      return Right(result.map((e) => e.toEntity()).toList());
    }on ServerException{
      return Left(ServerFailure(''));
    }on SocketException{
      return Left(ConnectionFailure('Failed to connect the network'));
    }on TlsException{
      return const Left(SecutitySLL("Sertifikat In Valid"));
    }
  }

  @override
  Future<Either<Failure, List<Series>>> getSeriesToday() async{
    try{
      final result = await remoteDataSource.getSeriesToday();
      return Right(result.map((e) => e.toEntity()).toList());
    }on ServerException{
      return Left(ServerFailure(''));
    }on SocketException{
      return Left(ConnectionFailure('Failed to connect the network'));
    }on TlsException{
      return const Left(SecutitySLL("Sertifikat In Valid"));
    }
  }

  @override
  Future<Either<Failure, List<Series>>> getSeriesOnAir() async{
    try{
      final result = await remoteDataSource.getSeriesOnAir();
      return Right(result.map((e) => e.toEntity()).toList());
    }on ServerException{
      return Left(ServerFailure(''));
    }on SocketException{
      return Left(ConnectionFailure('Failed to connect the network'));
    }on TlsException{
      return const Left(SecutitySLL("Sertifikat In Valid"));
    }
  }

  @override
  Future<Either<Failure, List<Series>>> getPopularSeries() async {
    try{
      final result = await remoteDataSource.getPopularSeries();
      return Right(result.map((e) => e.toEntity()).toList());
    }on ServerException{
      return Left(ServerFailure(''));
    }on SocketException{
      return Left(ConnectionFailure('Failed to connect the network'));
    }on TlsException{
      return const Left(SecutitySLL("Sertifikat In Valid"));
    }
  }

  @override
  Future<Either<Failure, List<Series>>> getTopRatedSeries() async{
    try{
      final result = await remoteDataSource.getTopRatedSeries();
      return Right(result.map((e) => e.toEntity()).toList());
    }on ServerException{
      return Left(ServerFailure(''));
    }on SocketException{
      return Left(ConnectionFailure('Failed to connect the network'));
    }on TlsException{
      return const Left(SecutitySLL("Sertifikat In Valid"));
    }
  }
  @override
  Future<Either<Failure, SeriesDetail>> getSeriesDetail(int id) async {
    try{
      final result = await remoteDataSource.getSeriesDetail(id);
      return Right(result.toEntity());
    }on ServerException{
      return Left(ServerFailure(''));
    }on SocketException{
      return Left(ConnectionFailure('Failed connect to network'));
    }on TlsException{
      return const Left(SecutitySLL("Sertifikat In Valid"));
    }

  }

  @override
  Future<Either<Failure, List<Series>>> getSeriesRecommendations(int id) async{
    try{
      final result = await remoteDataSource.getSeriesRecommendations(id);
      return Right(result.map((e) => e.toEntity()).toList());
    }on ServerFailure{
      return Left(ServerFailure(''));
    }on SocketException{
      return Left(ConnectionFailure('Failed connect to network'));
    }on TlsException{
      return const Left(SecutitySLL("Sertifikat In Valid"));
    }
  }
  @override
  Future<bool> isAddedToWatchlistSeries(int id) async{

    final result = await seriesLocalDataSource.getSeriesById(id);
    return result != null;
  }
  @override
  Future<Either<Failure, List<Series>>> getWatchlistSeries() async{
    final result = await seriesLocalDataSource.getWatchlistSeries();
    return Right(result.map((e) => e.toEntity()).toList());
  }


  @override
  Future<Either<Failure, String>> removeWatchlistSeries(SeriesDetail seriesDetail) async{

    try{
      final result = await seriesLocalDataSource.removeWatchlistSeries(SeriesTable.fromEntity(seriesDetail));
      return Right(result);
    }on DataBaseDb catch(e){
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> saveWatchlistSeries(SeriesDetail seriesDetail) async{
    try{
      final result = await seriesLocalDataSource.insertSeriesWatchlist(SeriesTable.fromEntity(seriesDetail));
      return Right(result);
    }on DataBaseDb catch (e){
      return Left(DatabaseFailure(e.message));
    }catch(e){
      throw e;
    }
  }

}