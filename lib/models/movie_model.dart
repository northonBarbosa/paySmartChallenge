import 'dart:convert';

class MovieModel {
  final int id;
  final String title;
  final String poster;
  final List<int> genreIds;
  final String releaseDate;

  const MovieModel({
    required this.id,
    required this.title,
    required this.genreIds,
    required this.poster,
    required this.releaseDate,
  });

  factory MovieModel.fromJson(String value) => MovieModel.fromMap(json.decode(value));

  factory MovieModel.fromMap(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        title: json['title'],
        genreIds: List<int>.from(
          json['genre_ids'].map((value) => value),
        ),
        poster: json['poster_path'] ?? '',
        releaseDate: json['release_date'] ?? '',
      );
}
