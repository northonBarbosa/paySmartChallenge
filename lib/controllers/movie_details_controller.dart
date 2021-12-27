import 'package:dartz/dartz.dart';
import 'package:moviefy_app/errors/moviefy_errors.dart';
import 'package:moviefy_app/models/movie_details_model.dart';
import 'package:moviefy_app/repositories/moviefy_api_repository.dart';

class MovieDetailsController {
  final MoviefyApiRepository _repository = MoviefyApiRepository();

  MoviefyError? moviefyError;
  MovieDetailsModel? movieDetailsModel;

  Future<Either<MoviefyError, MovieDetailsModel>> fetchMovieDetails({required int movieId}) async {
    final result = await _repository.fetchMovieDetails(movieId);
    result.fold(
      (error) => moviefyError = error,
      (details) => movieDetailsModel = details,
    );

    return result;
  }
}
