import 'package:dartz/dartz.dart';

import '/errors/moviefy_errors.dart';
import '/models/movie_model.dart';
import '/models/movie_response_model.dart';
import '/repositories/moviefy_api_repository.dart';

class SearchMovieController {
  final MoviefyApiRepository _repository = MoviefyApiRepository();

  MoviefyError? moviefyError;
  MovieResponseModel? moviefyResponseModel;

  int get totalPages => moviefyResponseModel?.totalPages ?? 1;
  List<MovieModel> get moviesList => moviefyResponseModel?.movies ?? [];

  Future<Either<MoviefyError, MovieResponseModel>> searchMovie({int page = 1, required String title}) async {
    final result = await _repository.searchMovie(title, page);
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
