// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:rextor_movie/data/models/movie/movie_model.dart';
import 'package:equatable/equatable.dart';

class MovieResponse extends Equatable {
  final List<FilmMovie> movieList;

  MovieResponse({required this.movieList});

  @override
  List<Object> get props => [movieList];
  factory MovieResponse.fromJson(Map<String, dynamic> json) => MovieResponse(
        movieList: List<FilmMovie>.from((json["results"] as List)
            .map((x) => FilmMovie.fromJson(x))
            .where((element) => element.posterPath != null)),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(movieList.map((x) => x.toJson())),
      };
}
