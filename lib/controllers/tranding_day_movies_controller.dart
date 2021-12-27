import 'package:dartz/dartz.dart';

import '/models/section_movies_response_model.dart';
import '/errors/moviefy_errors.dart';
import '/models/movie_model.dart';
import '/repositories/moviefy_api_repository.dart';

class TrendingDayMoviesController {
  final MoviefyApiRepository _repository = MoviefyApiRepository();

  MoviefyError? moviefyError;
  SectionMoviesResponseModel? movieResponseModel;

  List<MovieModel> get moviesList => movieResponseModel?.movies ?? [];

  Future<Either<MoviefyError, SectionMoviesResponseModel>> fetchTrendingDayMovies() async {
    final result = await _repository.fetchTrendingDayMovies();
    result.fold(
      (error) => moviefyError = error,
      (movie) => movieResponseModel = movie,
    );

    return result;
  }
}
