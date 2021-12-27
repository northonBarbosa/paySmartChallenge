import 'package:dartz/dartz.dart';

import '/models/section_movies_response_model.dart';
import '/errors/moviefy_errors.dart';
import '/models/movie_model.dart';
import '/repositories/moviefy_api_repository.dart';

class OnlyTheatersMoviesController {
  final MoviefyApiRepository _repository = MoviefyApiRepository();

  MoviefyError? moviefyError;
  SectionMoviesResponseModel? movieResponseModel;

  List<MovieModel> get moviesList => movieResponseModel?.movies ?? [];

  Future<Either<MoviefyError, SectionMoviesResponseModel>> fetchOnlyTheatersMovies() async {
    final result = await _repository.fetchOnlyTheatersMovies();
    result.fold(
      (error) => moviefyError = error,
      (movie) => movieResponseModel = movie,
    );

    return result;
  }
}
