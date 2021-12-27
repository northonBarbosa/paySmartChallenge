import 'movie_model.dart';

import 'dart:convert';

class NorthonsMoviesResponseModel {
  final List<MovieModel> movies;

  NorthonsMoviesResponseModel({
    required this.movies,
  });

  factory NorthonsMoviesResponseModel.fromJson(String value) => NorthonsMoviesResponseModel.fromMap(json.decode(value));

  factory NorthonsMoviesResponseModel.fromMap(Map<String, dynamic> json) => NorthonsMoviesResponseModel(
        movies: List<MovieModel>.from(
          json["items"].map(
            (movie) => MovieModel.fromMap(movie),
          ),
        ),
      );
}
