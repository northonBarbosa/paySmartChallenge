import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/controllers/movie_genres_controller.dart';
import '/controllers/search_movies_controller.dart';
import '/screens/all_movies/all_movies_screen.dart';
import '/utils/ui/colors.dart';
import '/widgets/cards/movie_card_widget.dart';
import '/widgets/loadings/custom_circular_progress_indicator.dart';

class SearchMovieScreen extends StatefulWidget {
  const SearchMovieScreen({Key? key}) : super(key: key);

  @override
  State<SearchMovieScreen> createState() => _SearchMovieScreenState();
}

class _SearchMovieScreenState extends State<SearchMovieScreen> {
  final SearchMovieController _searchMoviesController = SearchMovieController();
  final MovieGenresController _genresController = Get.find();
  final TextEditingController _searchTextController = TextEditingController();

  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            title: TextField(
              controller: _searchTextController,
              onChanged: (text) {
                _searchMoviesController.moviesList.clear();
                if (text.isNotEmpty) {
                  _searchMoviesController.searchMovie(title: text).then((value) {
                    if (mounted) setState(() {});
                  });
                }
              },
              textCapitalization: TextCapitalization.words,
              cursorColor: kMoviefyDesertSand,
              decoration: const InputDecoration(
                isCollapsed: true,
                isDense: true,
                filled: true,
                fillColor: kMoviefyBackgroundColor,
                contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kMoviefyPrimaryColor,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                hintText: 'Buscar Filme',
              ),
            ),
          ),
          _searchMoviesController.moviesList.isEmpty
              ? const SliverToBoxAdapter(
                  child: Center(child: Text('Nenhum filme encontrado')),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, i) {
                      if (i == _searchMoviesController.moviesList.length - 3 &&
                          _currentPage != _searchMoviesController.totalPages) {
                        _searchMoviesController
                            .searchMovie(page: _currentPage, title: _searchTextController.text)
                            .then((value) => setState(() => _currentPage++));
                      }
                      if (i == _searchMoviesController.moviesList.length) {
                        return const Center(
                          child: CustomCircularProgressIndicator(),
                        );
                      }
                      return MovieCard(
                        title: _searchMoviesController.moviesList[i].title,
                        poster: _searchMoviesController.moviesList[i].poster,
                        genres: _genresController.getGenresName(_searchMoviesController.moviesList[i].genreIds),
                        releaseDate: _searchMoviesController.moviesList[i].releaseDate,
                      );
                    },
                    childCount: _searchMoviesController.moviesList.length +
                        (_currentPage != _searchMoviesController.totalPages ? 1 : 0),
                  ),
                ),
        ],
      ),
    );
  }
}
