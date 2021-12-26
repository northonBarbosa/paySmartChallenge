import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '/utils/ui/colors.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
    required this.title,
    required this.poster,
    required this.genres,
    required this.releaseDate,
  }) : super(key: key);

  final String title;
  final String poster;
  final List<String> genres;
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Container(
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
                image: NetworkImage('https://image.tmdb.org/t/p/original/$poster'),
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
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(left: 3, right: 8),
                    scrollDirection: Axis.horizontal,
                    itemCount: genres.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Chip(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          backgroundColor: kMoviefyPrimaryColor,
                          elevation: 2,
                          side: const BorderSide(
                            color: kMoviefyDesertSand,
                            width: 1.1,
                          ),
                          label: Text(genres[index]),
                          labelStyle: GoogleFonts.comfortaa(
                            color: Colors.white,
                            fontSize: 11,
                          ),
                          visualDensity: VisualDensity.compact,
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 5,
                      ),
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: const BoxDecoration(
                        color: kMoviefyBlackCoral,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            SimpleLineIcons.calendar,
                            color: kMoviefyDesertSand,
                            size: 13,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            DateFormat('dd/MM/yyyy').format(DateTime.parse(releaseDate)),
                            style: GoogleFonts.comfortaa(
                              color: kMoviefyDesertSand,
                              height: 1.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 5,
                      ),
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        color: kMoviefyDesertSand,
                        border: Border.all(color: kMoviefyBlackCoral, width: 1),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            SimpleLineIcons.heart,
                            color: kMoviefyBlackCoral,
                            size: 13,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Favoritar',
                            style: GoogleFonts.comfortaa(
                              color: kMoviefyBlackCoral,
                              height: 1.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
