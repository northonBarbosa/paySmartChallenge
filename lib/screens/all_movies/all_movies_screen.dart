import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/widgets/appbar/moviefy_appbar.dart';
import '/widgets/cards/movie_card_widget.dart';
import '/widgets/loadings/custom_circular_progress_indicator.dart';
import '/widgets/loadings/moviefy_loading_lottie.dart';
import '/controllers/all_movies_controller.dart';
import '/controllers/movie_genres_controller.dart';

class AllMoviesScreen extends StatefulWidget {
  const AllMoviesScreen({Key? key}) : super(key: key);

  @override
  State<AllMoviesScreen> createState() => _AllMoviesScreenState();
}

class _AllMoviesScreenState extends State<AllMoviesScreen> with AutomaticKeepAliveClientMixin {
  final AllMoviesController _allMoviesController = AllMoviesController();
  final MovieGenresController _genresController = Get.find();

  int _currentPage = 1;
  bool isLoading = true;

  @override
  void initState() {
    initializer();
    super.initState();
  }

  initializer() async {
    await _genresController.fetchGenres();
    await _allMoviesController.fetchMovies(page: _currentPage).then((value) {
      if (mounted) {
        setState(() {
          _currentPage++;
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return isLoading
        ? const MoviefyLoadingLottie()
        : CustomScrollView(
            slivers: [
              const MoviefyAppBar(title: 'Filmes'),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, i) {
                  if (i == _allMoviesController.moviesList.length - 3 &&
                      _currentPage != _allMoviesController.totalPages) {
                    _allMoviesController.fetchMovies(page: _currentPage).then((value) {
                      if (mounted) setState(() => _currentPage++);
                    });
                  }
                  if (i == _allMoviesController.moviesList.length) {
                    return const Center(
                      child: CustomCircularProgressIndicator(),
                    );
                  }
                  return FadeIn(
                    child: MovieCard(
                      id: _allMoviesController.moviesList[i].id,
                      title: _allMoviesController.moviesList[i].title,
                      poster: _allMoviesController.moviesList[i].poster,
                      genres: _genresController.getGenresName(_allMoviesController.moviesList[i].genreIds),
                      releaseDate: _allMoviesController.moviesList[i].releaseDate,
                    ),
                  );
                },
                    childCount: _allMoviesController.moviesList.length +
                        (_currentPage != _allMoviesController.totalPages ? 1 : 0)),
              ),
            ],
          );
  }

  @override
  bool get wantKeepAlive => true;
}
