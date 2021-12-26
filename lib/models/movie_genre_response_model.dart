import 'dart:convert';

import 'package:moviefy_app/models/movie_genre_model.dart';

class MovieGenreResponseModel {
  final List<MovieGenreModel> genres;

  MovieGenreResponseModel({
    required this.genres,
  });

  factory MovieGenreResponseModel.fromJson(String value) => MovieGenreResponseModel.fromMap(json.decode(value));

  factory MovieGenreResponseModel.fromMap(Map<String, dynamic> json) => MovieGenreResponseModel(
        genres: List<MovieGenreModel>.from(
          json["genres"].map(
            (genre) => MovieGenreModel.fromMap(genre),
          ),
        ),
      );
}
