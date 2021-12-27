import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/appbar/custom_sliver_appbar_widget.dart';
import '/controllers/movie_genres_controller.dart';
import '/controllers/search_movies_controller.dart';
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
              ? SliverToBoxAdapter(
                  child: SizedBox(
                    height: Get.height - AppBar().preferredSize.height - Get.mediaQuery.viewPadding.top,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image(
                          image: const AssetImage('assets/clapperboard.png'),
                          height: Get.width * 0.25,
                          width: Get.width * 0.25,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Nenhum filme encontrado',
                          style: GoogleFonts.anton(
                            fontSize: 16,
                            letterSpacing: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
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
                      return FadeIn(
                        child: MovieCard(
                          id: _searchMoviesController.moviesList[i].id,
                          title: _searchMoviesController.moviesList[i].title,
                          poster: _searchMoviesController.moviesList[i].poster,
                          genres: _genresController.getGenresName(_searchMoviesController.moviesList[i].genreIds),
                          releaseDate: _searchMoviesController.moviesList[i].releaseDate,
                        ),
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
