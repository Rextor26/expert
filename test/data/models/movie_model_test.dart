// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:rextor_movie/data/models/movie/movie_model.dart';
import 'package:rextor_movie/domain/entities/movie/movie.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final filmMovieModel = FilmMovie(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );

  final tMovie = Movie(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );

  test('should be a subclass of Movie entity', () async {
    final result = filmMovieModel.toEntity();
    expect(result, tMovie);
  });
}
