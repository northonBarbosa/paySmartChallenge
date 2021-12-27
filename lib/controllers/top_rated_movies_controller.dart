import 'package:dartz/dartz.dart';

import '/models/section_movies_response_model.dart';
import '/errors/moviefy_errors.dart';
import '/models/movie_model.dart';
import '/repositories/moviefy_api_repository.dart';

class TopRatedMoviesController {
  final MoviefyApiRepository _repository = MoviefyApiRepository();

  MoviefyError? moviefyError;
  SectionMoviesResponseModel? movieResponseModel;

  List<MovieModel> get moviesList => movieResponseModel?.movies ?? [];

  Future<Either<MoviefyError, SectionMoviesResponseModel>> fetchTopRatedMovies() async {
    final result = await _repository.fetchTopRatedMovies();
    result.fold(
      (error) => moviefyError = error,
      (movie) => movieResponseModel = movie,
    );

    return result;
  }
}
