import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviefy_app/screens/search/search_screen.dart';
import 'package:moviefy_app/utils/ui/colors.dart';
import 'package:moviefy_app/widgets/cards/movie_card_widget.dart';

import '/controllers/all_movies_controller.dart';
import '/controllers/movie_genres_controller.dart';

class AllMoviesScreen extends StatefulWidget {
  const AllMoviesScreen({Key? key}) : super(key: key);

  @override
  State<AllMoviesScreen> createState() => _AllMoviesScreenState();
}

class _AllMoviesScreenState extends State<AllMoviesScreen> {
  final AllMoviesController _allMoviesController = AllMoviesController();
  final MovieGenresController _genresController = Get.put(MovieGenresController());

  int _currentPage = 1;

  @override
  void initState() {
    initializer();
    super.initState();
  }

  initializer() async {
    await _genresController.fetchGenres();
    await _allMoviesController.fetchMovies(page: _currentPage).then((value) {
      if (mounted) setState(() => _currentPage++);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(
          leading: IconButton(
            onPressed: () => Get.to(const SearchMovieScreen()),
            icon: const Icon(SimpleLineIcons.magnifier),
          ),
          title: Text(
            'Filmes',
            style: GoogleFonts.anton(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, i) {
            if (i == _allMoviesController.moviesList.length - 3 && _currentPage != _allMoviesController.totalPages) {
              _allMoviesController.fetchMovies(page: _currentPage).then((value) {
                if (mounted) setState(() => _currentPage++);
              });
            }
            if (i == _allMoviesController.moviesList.length) {
              return const Center(
                child: CircularProgressIndicator(
                  color: kMoviefyBlackCoral,
                ),
              );
            }
            return FadeIn(
              child: MovieCard(
                title: _allMoviesController.moviesList[i].title,
                poster: _allMoviesController.moviesList[i].poster,
                genres: _genresController.getGenresName(_allMoviesController.moviesList[i].genreIds),
                releaseDate: _allMoviesController.moviesList[i].releaseDate,
              ),
            );
          },
              childCount:
                  _allMoviesController.moviesList.length + (_currentPage != _allMoviesController.totalPages ? 1 : 0)),
        ),
      ],
    );
  }
}

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key? key,
    this.leading,
    this.title,
  }) : super(key: key);

  final Widget? leading;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: leading,
      title: title,
      centerTitle: true,
      floating: true,
      backgroundColor: kMoviefyBlackCoral,
    );
  }
}
