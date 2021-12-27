import 'package:dartz/dartz.dart';

import '/errors/moviefy_errors.dart';
import '/models/movie_model.dart';
import '../models/movie_response_model.dart';
import '/repositories/moviefy_api_repository.dart';

class AllMoviesController {
  final MoviefyApiRepository _repository = MoviefyApiRepository();

  MoviefyError? moviefyError;
  MovieResponseModel? movieResponseModel;

  int get totalPages => movieResponseModel?.totalPages ?? 1;
  List<MovieModel> get moviesList => movieResponseModel?.movies ?? [];

  Future<Either<MoviefyError, MovieResponseModel>> fetchMovies({int page = 1}) async {
    final result = await _repository.fetchMovies(page);
    result.fold(
      (error) => moviefyError = error,
      (movie) {
        if (movieResponseModel != null) {
          movieResponseModel!.page = movie.page;
          movieResponseModel!.movies.addAll(movie.movies);
        } else {
          movieResponseModel = movie;
        }
      },
    );

    return result;
  }
}
