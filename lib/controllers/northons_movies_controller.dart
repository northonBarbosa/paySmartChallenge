import 'package:dartz/dartz.dart';

import '/models/northons_movies_response_model.dart';
import '/errors/moviefy_errors.dart';
import '/models/movie_model.dart';
import '/repositories/moviefy_api_repository.dart';

class NorthonsMoviesController {
  final MoviefyApiRepository _repository = MoviefyApiRepository();

  MoviefyError? moviefyError;
  NorthonsMoviesResponseModel? movieResponseModel;

  List<MovieModel> get moviesList => movieResponseModel?.movies ?? [];

  Future<Either<MoviefyError, NorthonsMoviesResponseModel>> fetchNorthonsMovies() async {
    final result = await _repository.fetchNorthonsMovies();
    result.fold(
      (error) => moviefyError = error,
      (movie) => movieResponseModel = movie,
    );

    return result;
  }
}
