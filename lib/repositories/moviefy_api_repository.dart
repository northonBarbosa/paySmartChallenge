import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '/models/northons_movies_response_model.dart';
import '/core/api/api.dart';
import '/errors/moviefy_errors.dart';
import '/models/movie_details_model.dart';
import '/models/movie_genre_response_model.dart';
import '/models/movie_response_model.dart';
import '/models/section_movies_response_model.dart';

class MoviefyApiRepository {
  final Dio _dio = Dio(kBaseClientOptions);

  Future<Either<MoviefyError, MovieResponseModel>> fetchMovies(int page) async {
    try {
      final response = await _dio.get('/movie/popular?page=$page');
      final model = MovieResponseModel.fromMap(response.data);

      return Right(model);
    } on DioError catch (error) {
      return Left(MoviefyApiRepositoryError(error.response!.data['status_message']));
    } on Exception catch (error) {
      return Left(MoviefyApiRepositoryError(error.toString()));
    }
  }

  Future<Either<MoviefyError, MovieDetailsModel>> fetchMovieDetails(int id) async {
    try {
      final response = await _dio.get('/movie/$id');
      final model = MovieDetailsModel.fromMap(response.data);

      return Right(model);
    } on DioError catch (error) {
      return Left(MoviefyApiRepositoryError(error.response!.data['status_message']));
    } on Exception catch (error) {
      return Left(MoviefyApiRepositoryError(error.toString()));
    }
  }

  Future<Either<MoviefyError, SectionMoviesResponseModel>> fetchTrendingMovies() async {
    try {
      final response = await _dio.get('/trending/movie/week');
      final model = SectionMoviesResponseModel.fromMap(response.data);

      return Right(model);
    } on DioError catch (error) {
      return Left(MoviefyApiRepositoryError(error.response!.data['status_message']));
    } on Exception catch (error) {
      return Left(MoviefyApiRepositoryError(error.toString()));
    }
  }

  Future<Either<MoviefyError, SectionMoviesResponseModel>> fetchTrendingDayMovies() async {
    try {
      final response = await _dio.get('/trending/movie/day');
      final model = SectionMoviesResponseModel.fromMap(response.data);

      return Right(model);
    } on DioError catch (error) {
      return Left(MoviefyApiRepositoryError(error.response!.data['status_message']));
    } on Exception catch (error) {
      return Left(MoviefyApiRepositoryError(error.toString()));
    }
  }

  Future<Either<MoviefyError, NorthonsMoviesResponseModel>> fetchNorthonsMovies() async {
    try {
      final response = await _dio.get('/list/8173105');
      final model = NorthonsMoviesResponseModel.fromMap(response.data);

      return Right(model);
    } on DioError catch (error) {
      return Left(MoviefyApiRepositoryError(error.response!.data['status_message']));
    } on Exception catch (error) {
      return Left(MoviefyApiRepositoryError(error.toString()));
    }
  }

  Future<Either<MoviefyError, SectionMoviesResponseModel>> fetchTopRatedMovies() async {
    try {
      final response = await _dio.get('/movie/top_rated?region=BR');
      final model = SectionMoviesResponseModel.fromMap(response.data);

      return Right(model);
    } on DioError catch (error) {
      return Left(MoviefyApiRepositoryError(error.response!.data['status_message']));
    } on Exception catch (error) {
      return Left(MoviefyApiRepositoryError(error.toString()));
    }
  }

  Future<Either<MoviefyError, SectionMoviesResponseModel>> fetchOnlyTheatersMovies() async {
    try {
      final response = await _dio.get('/movie/now_playing?region=BR');
      final model = SectionMoviesResponseModel.fromMap(response.data);

      return Right(model);
    } on DioError catch (error) {
      return Left(MoviefyApiRepositoryError(error.response!.data['status_message']));
    } on Exception catch (error) {
      return Left(MoviefyApiRepositoryError(error.toString()));
    }
  }

  Future<Either<MoviefyError, MovieGenreResponseModel>> fetchGenres() async {
    try {
      final response = await _dio.get('/genre/movie/list');
      final model = MovieGenreResponseModel.fromMap(response.data);

      return Right(model);
    } on DioError catch (error) {
      return Left(MoviefyApiRepositoryError(error.response!.data['status_message']));
    } on Exception catch (error) {
      return Left(MoviefyApiRepositoryError(error.toString()));
    }
  }

  Future<Either<MoviefyError, MovieResponseModel>> searchMovie(String title, int page) async {
    try {
      final response = await _dio.get(
        '/search/movie?page=$page',
        queryParameters: {'query': title, 'include_adult': false},
      );
      final model = MovieResponseModel.fromMap(response.data);

      return Right(model);
    } on DioError catch (error) {
      return Left(MoviefyApiRepositoryError(error.response!.data['status_message']));
    } on Exception catch (error) {
      return Left(MoviefyApiRepositoryError(error.toString()));
    }
  }
}
