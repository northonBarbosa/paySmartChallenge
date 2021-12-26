import 'package:dartz/dartz.dart';

import '/errors/moviefy_errors.dart';
import '/models/movie_model.dart';
import '../models/movie_response_model.dart';
import '/repositories/moviefy_api_repository.dart';

class AllMoviesController {
  final MoviefyApiRepository _repository = MoviefyApiRepository();

  MoviefyError? moviefyError;
  MovieResponseModel? moviefyResponseModel;

  int get currentPage => moviefyResponseModel?.page ?? 1;
  int get totalPages => moviefyResponseModel?.totalPages ?? 1;
  List<MovieModel> get moviesList => moviefyResponseModel?.movies ?? [];

  Future<Either<MoviefyError, MovieResponseModel>> fetchMovies({int page = 1}) async {
    final result = await _repository.fetchMovies(page);
    result.fold(
      (error) => moviefyError = error,
      (movie) {
        if (moviefyResponseModel != null) {
          moviefyResponseModel!.page = movie.page;
          moviefyResponseModel!.movies.addAll(movie.movies);
        } else {
          moviefyResponseModel = movie;
        }
      },
    );

    return result;
  }
}
