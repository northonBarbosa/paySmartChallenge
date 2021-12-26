import 'package:dartz/dartz.dart';
import 'package:moviefy_app/errors/moviefy_errors.dart';
import 'package:moviefy_app/models/movie_genre_model.dart';
import 'package:moviefy_app/models/movie_genre_response_model.dart';
import 'package:moviefy_app/repositories/moviefy_api_repository.dart';

class MovieGenresController {
  final MoviefyApiRepository _repository = MoviefyApiRepository();

  MoviefyError? moviefyError;
  MovieGenreResponseModel? movieGenreResponseModel;

  List<MovieGenreModel> get genreList => movieGenreResponseModel?.genres ?? [];

  Future<Either<MoviefyError, MovieGenreResponseModel>> fetchGenres() async {
    final result = await _repository.fetchGenres();
    result.fold(
      (error) => moviefyError = error,
      (genre) => movieGenreResponseModel = genre,
    );

    return result;
  }
}