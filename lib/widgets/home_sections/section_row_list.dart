import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/models/movie_model.dart';
import '/widgets/cards/movie_card_section_widget.dart';

class SectionRowList extends StatelessWidget {
  const SectionRowList({
    Key? key,
    required List<MovieModel> moviesList,
  })  : _moviesList = moviesList,
        super(key: key);

  final List<MovieModel> _moviesList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.width * 0.38,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: _moviesList.length,
        itemBuilder: (context, index) {
          return MovieCardSectionWidget(
            movieId: _moviesList[index].id,
            backgroundPoster: _moviesList[index].background,
            title: _moviesList[index].title,
          );
        },
      ),
    );
  }
}
