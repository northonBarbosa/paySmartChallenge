import 'movie_model.dart';

import 'dart:convert';

class SectionMoviesResponseModel {
  final List<MovieModel> movies;

  SectionMoviesResponseModel({
    required this.movies,
  });

  factory SectionMoviesResponseModel.fromJson(String value) => SectionMoviesResponseModel.fromMap(json.decode(value));

  factory SectionMoviesResponseModel.fromMap(Map<String, dynamic> json) => SectionMoviesResponseModel(
        movies: List<MovieModel>.from(
          json["results"].map(
            (movie) => MovieModel.fromMap(movie),
          ),
        ),
      );
}
