import 'dart:convert';

import 'package:moviefy_app/models/movie_genre_model.dart';

class MovieDetailsModel {
  final int id;
  final String title;
  final String poster;
  final String background;
  final List<MovieGenreModel> genres;
  final String releaseDate;
  final String overview;

  const MovieDetailsModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.background,
    required this.genres,
    required this.releaseDate,
    required this.overview,
  });

  factory MovieDetailsModel.fromJson(String value) => MovieDetailsModel.fromMap(json.decode(value));

  factory MovieDetailsModel.fromMap(Map<String, dynamic> json) => MovieDetailsModel(
        id: json['id'],
        title: json['title'],
        poster: json['poster_path'] ?? '',
        background: json['backdrop_path'] ?? '',
        genres: List<MovieGenreModel>.from(
          json['genres'].map((value) => MovieGenreModel.fromMap(value)),
        ),
        releaseDate: json['release_date'] ?? '',
        overview: json['overview'] ?? '',
      );
}
