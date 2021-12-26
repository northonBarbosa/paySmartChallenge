import 'dart:convert';

class MovieGenreModel {
  final int id;
  final String name;

  MovieGenreModel({
    required this.id,
    required this.name,
  });

  factory MovieGenreModel.fromJson(String value) => MovieGenreModel.fromMap(json.decode(value));

  factory MovieGenreModel.fromMap(Map<String, dynamic> json) => MovieGenreModel(
        id: json['id'],
        name: json['name'],
      );
}
