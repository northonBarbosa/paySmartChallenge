import 'movie_model.dart';

import 'dart:convert';

class MovieResponseModel {
  int page;
  final int totalPages;
  final List<MovieModel> movies;

  MovieResponseModel({
    required this.page,
    required this.totalPages,
    required this.movies,
  });

  factory MovieResponseModel.fromJson(String value) => MovieResponseModel.fromMap(json.decode(value));

  factory MovieResponseModel.fromMap(Map<String, dynamic> json) => MovieResponseModel(
        page: json['page'],
        totalPages: json['total_pages'],
        movies: List<MovieModel>.from(
          json["results"].map(
            (movie) => MovieModel.fromMap(movie),
          ),
        ),
      );
}
