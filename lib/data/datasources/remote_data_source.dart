// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:rextor_movie/data/models/movie/movie_detail_model.dart';
import 'package:rextor_movie/data/models/movie/movie_model.dart';
import 'package:rextor_movie/data/models/movie/movie_response.dart';
import 'package:rextor_movie/common/exception.dart';
import 'package:rextor_movie/data/models/series/series_detail_model.dart';
import 'package:rextor_movie/data/models/series/series_model.dart';
import 'package:rextor_movie/data/models/series/series_response.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  //movie
  Future<List<FilmMovie>> getNowPlayingMovies();
  Future<List<FilmMovie>> getPopularMovies();
  Future<List<FilmMovie>> getTopRatedMovies();
  Future<MovieDetailResponse> getMovieDetail(int id);
  Future<List<FilmMovie>> getMovieRecommendations(int id);
  Future<List<FilmMovie>> searchMovies(String query);

  //series
  Future<List<SeriesModel>> getSeriesRecommendations(int id);
  Future<List<SeriesModel>> getSeriesToday();
  Future<List<SeriesModel>> getSeriesOnAir();
  Future<List<SeriesModel>> getTopRatedSeries();
  Future<List<SeriesModel>> getPopularSeries();
  Future<SeriesDetailResponse> getSeriesDetail(int id);
  Future<List<SeriesModel>> searchSeries(String query);
}

//movie
class RemoteDataSourceImpl implements RemoteDataSource {
  static const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  static const BASE_URL = 'https://api.themoviedb.org/3';

  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<FilmMovie>> getNowPlayingMovies() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/now_playing?$API_KEY'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieDetailResponse> getMovieDetail(int id) async {
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/$id?$API_KEY'));

    if (response.statusCode == 200) {
      return MovieDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<FilmMovie>> getMovieRecommendations(int id) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/movie/$id/recommendations?$API_KEY'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<FilmMovie>> getPopularMovies() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/popular?$API_KEY'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<FilmMovie>> getTopRatedMovies() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/top_rated?$API_KEY'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<FilmMovie>> searchMovies(String query) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/search/movie?$API_KEY&query=$query'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }
  
  //Series
  @override
  Future<SeriesDetailResponse> getSeriesDetail(int id) async{
    final response = await client.get(Uri.parse('$BASE_URL/tv/$id?$API_KEY'));
    if(response.statusCode == 200){
      return SeriesDetailResponse.fromJson(json.decode(response.body));
    }else{
      throw ServerException();
    }
  }
  
  @override
  Future<List<SeriesModel>> getSeriesToday() async{
    final response = await client.get(Uri.parse('$BASE_URL/tv/airing_today?$API_KEY'));

    if(response.statusCode == 200){
      return ResponseSeries.fromJson(json.decode(response.body)).seriesList;

    }else{
      throw ServerException();
    }
  }
  
  @override
  Future<List<SeriesModel>> getSeriesOnAir() async {
    final response = await client.get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY'));
    if(response.statusCode == 200){
      return ResponseSeries.fromJson(json.decode(response.body)).seriesList;
    }else{
      throw ServerException();
    }
  }
  
  @override
  Future<List<SeriesModel>> getPopularSeries() async{
    final response = await client.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY'));
    if(response.statusCode == 200){
      return ResponseSeries.fromJson(json.decode(response.body)).seriesList;
    }else{
      throw ServerException();
    }
  }

  
  @override
  Future<List<SeriesModel>> getSeriesRecommendations(int id) async {
    final response = await client.get(Uri.parse('$BASE_URL/tv/$id/recommendations?$API_KEY'));
    if(response.statusCode == 200){
      return ResponseSeries.fromJson(json.decode(response.body)).seriesList;
    }
    throw ServerException();
  }
  
  @override
  Future<List<SeriesModel>> getTopRatedSeries() async{
    final response = await client.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY'));
    if(response.statusCode == 200){
      return ResponseSeries.fromJson(json.decode(response.body)).seriesList;
    }else{
      throw ServerException();
    }
  }
  
  @override
  Future<List<SeriesModel>> searchSeries(String query) async{
    final response = await client.get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$query'));
    if(response.statusCode == 200){
      return ResponseSeries.fromJson(json.decode(response.body)).seriesList;
    }else{
      throw ServerException();
    }
  }
}
