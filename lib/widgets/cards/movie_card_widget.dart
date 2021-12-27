import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '/widgets/buttons/movie_favorite_button.dart';
import '/widgets/chips/movie_release_date_chip.dart';

import '/screens/movie_details/movie_details_screen.dart';
import '/widgets/chips/movie_genre_chip.dart';
import '/utils/ui/colors.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
    required this.id,
    required this.title,
    required this.poster,
    required this.genres,
    required this.releaseDate,
  }) : super(key: key);

  final int id;
  final String title;
  final String poster;
  final List<String> genres;
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    late ImageProvider _posterImage;

    poster != ''
        ? _posterImage = NetworkImage('https://image.tmdb.org/t/p/original/$poster')
        : _posterImage = const NetworkImage(
            'https://images.unsplash.com/photo-1620145648299-f926ac0a9470?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80');

    return GestureDetector(
      onTap: () => Get.to(MovieDetailsScreen(movieId: id)),
      child: Container(
        height: 150,
        width: Get.width,
        margin: EdgeInsets.fromLTRB(Get.width * 0.03, 8, Get.width * 0.03, 3),
        decoration: BoxDecoration(
          color: kMoviefyPrimaryColor,
          boxShadow: [
            BoxShadow(
              color: kMoviefyBlackCoral.withOpacity(0.4),
              blurRadius: 14,
              spreadRadius: 1,
              offset: const Offset(2, 2),
            ),
          ],
          gradient: const LinearGradient(
            colors: [kMoviefyPrimaryColor, kMoviefyDesertSand],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Row(
          children: [
            Hero(
              tag: 'movie_$id',
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(7),
                  ),
                  child: Image(
                    image: _posterImage,
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
              width: Get.width * 0.7,
              padding: const EdgeInsets.only(top: 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      title,
                      style: GoogleFonts.anton(fontSize: 18, letterSpacing: 0.4),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: 40,
                    child: genres.isEmpty
                        ? Chip(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            backgroundColor: kMoviefyPrimaryColor,
                            elevation: 2,
                            side: const BorderSide(
                              color: kMoviefyDesertSand,
                              width: 1.1,
                            ),
                            label: const Text('Sem gênero'),
                            labelStyle: GoogleFonts.comfortaa(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                            visualDensity: VisualDensity.compact,
                          )
                        : Center(
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.only(left: 3, right: 8),
                              scrollDirection: Axis.horizontal,
                              itemCount: genres.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: MovieGenreChip(label: genres[index]),
                                );
                              },
                            ),
                          ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MovieReleaseDateChip(releaseDate: releaseDate),
                      MovieFavoriteButton(
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
