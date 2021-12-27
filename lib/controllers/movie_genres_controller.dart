import 'package:dartz/dartz.dart';
import 'package:moviefy_app/errors/moviefy_errors.dart';
import 'package:moviefy_app/models/movie_genre_model.dart';
import 'package:moviefy_app/models/movie_genre_response_model.dart';
import 'package:moviefy_app/repositories/moviefy_api_repository.dart';

class MovieGenresController {
  final MoviefyApiRepository _repository = MoviefyApiRepository();

  MoviefyError? moviefyError;
  MovieGenreResponseModel? movieGenreResponseModel;
  Map<int, String> genresMap = {};

  List<MovieGenreModel> get genreModelList => movieGenreResponseModel?.genres ?? [];

  Future<Either<MoviefyError, MovieGenreResponseModel>> fetchGenres() async {
    final result = await _repository.fetchGenres();
    result.fold(
      (error) => moviefyError = error,
      (genre) => movieGenreResponseModel = genre,
    );

    for (var i = 0; i < movieGenreResponseModel!.genres.length; i++) {
      genresMap.addAll({movieGenreResponseModel!.genres[i].id: movieGenreResponseModel!.genres[i].name});
    }

    return result;
  }

  List<String> getGenresName(List<int> genresIds) {
    if (genresMap.isEmpty) {
      fetchGenres();
    }

    List<String> _genresNameList = [];
    for (var i = 0; i < genresIds.length; i++) {
      _genresNameList.add(genresMap[genresIds[i]] ?? '');
    }

    return _genresNameList;
  }
}
