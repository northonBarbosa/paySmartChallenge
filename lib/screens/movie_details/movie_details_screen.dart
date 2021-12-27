import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '/controllers/movie_details_controller.dart';
import '/utils/ui/colors.dart';
import '/widgets/buttons/movie_favorite_button.dart';
import '/widgets/chips/movie_genre_chip.dart';
import '/widgets/chips/movie_release_date_chip.dart';
import '/widgets/loadings/moviefy_loading_lottie.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({Key? key, required this.movieId}) : super(key: key);

  final int movieId;

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final MovieDetailsController _detailsController = MovieDetailsController();
  ImageProvider posterImage = const NetworkImage(
      'https://images.unsplash.com/photo-1620145648299-f926ac0a9470?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80');

  ImageProvider backgroundImage = const NetworkImage(
      'https://images.unsplash.com/photo-1574267432553-4b4628081c31?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1331&q=80');

  bool isLoading = true;

  @override
  void initState() {
    initialize();
    super.initState();
  }

  initialize() async {
    await _detailsController.fetchMovieDetails(movieId: widget.movieId).then((value) {
      if (mounted) {
        setState(() => isLoading = false);
      }
    });

    if (_detailsController.movieDetailsModel!.poster != '') {
      posterImage = NetworkImage('https://image.tmdb.org/t/p/original/${_detailsController.movieDetailsModel!.poster}');
    }

    if (_detailsController.movieDetailsModel!.background != '') {
      backgroundImage =
          NetworkImage('https://image.tmdb.org/t/p/original/${_detailsController.movieDetailsModel!.background}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const MoviefyLoadingLottie()
          : FadeIn(
              child: Stack(
                children: [
                  Container(
                    height: Get.width * 0.58,
                    decoration: const BoxDecoration(
                      color: kMoviefyBlackCoral,
                      border: Border(
                        bottom: BorderSide(color: kMoviefyDesertSand, width: 5),
                      ),
                    ),
                    child: Image(
                      image: backgroundImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ListView(
                    padding: EdgeInsets.only(top: Get.width * 0.2),
                    children: [
                      Hero(
                        tag: 'movie_${widget.movieId}',
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: Get.width * 0.28),
                          height: Get.width * 0.65,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: kMoviefyPrimaryColor, width: 2),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(7),
                            ),
                            child: Image(
                              image: posterImage,
                              width: Get.width * 0.23,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                            // child:  FadeInImage(
                            //   image: NetworkImage('https://image.tmdb.org/t/p/original/fVzXp3NwovUlLe7fvoRynCmBPNc.jpg'),
                            //   placeholder: ,
                            //   width: Get.width * 0.2,
                            //   height: 150,
                            //   fit: BoxFit.cover,
                            //   ),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            const SizedBox(height: 15),
                            Text(
                              _detailsController.movieDetailsModel!.title,
                              style: GoogleFonts.anton(fontSize: 26),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MovieReleaseDateChip(
                                  releaseDate: _detailsController.movieDetailsModel!.releaseDate,
                                  fontSize: 18,
                                ),
                                MovieFavoriteButton(onTap: () {}, fontSize: 18),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6.5),
                              child: Wrap(
                                spacing: 8,
                                runSpacing: 12,
                                alignment: WrapAlignment.center,
                                children: [
                                  for (var i = 0; i < _detailsController.movieDetailsModel!.genres.length; i++)
                                    MovieGenreChip(
                                      label: _detailsController.movieDetailsModel!.genres[i].name,
                                      labelPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                                      fontSize: 16,
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                            Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(10, 32, 10, 20),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFfbf0d9),
                                    border: Border.all(color: kMoviefyPrimaryColor, width: 2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Text(
                                      _detailsController.movieDetailsModel!.overview,
                                      style: GoogleFonts.nunito(
                                        fontSize: 20,
                                        height: 1.5,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 30),
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: kMoviefyBlackCoral,
                                      border: Border.all(color: kMoviefyPrimaryColor, width: 2),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      'Sinopse',
                                      style: GoogleFonts.anton(
                                        fontSize: 18,
                                        color: kMoviefyDesertSand,
                                        letterSpacing: 1.5,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
