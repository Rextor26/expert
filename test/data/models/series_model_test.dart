// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:rextor_movie/data/models/series/series_model.dart';
import 'package:rextor_movie/domain/entities/series/series.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  final seriesModel = SeriesModel(
    backdropPath: "backdropPath",
    genreIds: [18],
    id: 11250,
    name: "Name",
    originCountry: ["CO"],
    originalLanguage: "es",
    originalName: "originalName",
    overview: "Toverview",
    popularity: 1.0,
    posterPath: "posterPath",
    voteAverage: 1.0,
    voteCount: 1
);
  final series = Series(
      backdropPath: "backdropPath",
      genreIds: [18],
      id: 11250,
      name: "Name",
      originCountry: ["CO"],
      originalLanguage: "es",
      originalName: "originalName",
      overview: "Toverview",
      popularity: 1.0,
      posterPath: "posterPath",
      voteAverage: 1.0,
      voteCount: 1
  );


  test('should be a subclass of Series entity', () async {
    final result = seriesModel.toEntity();
    expect(result, series);
  });
}