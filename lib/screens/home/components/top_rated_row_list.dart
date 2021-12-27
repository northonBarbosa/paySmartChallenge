import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/controllers/top_rated_movies_controller.dart';
import '/widgets/loadings/custom_circular_progress_indicator.dart';
import '/widgets/home_sections/section_row_list.dart';
import '/widgets/home_sections/section_title.dart';

class TopRatedMoviesRowList extends StatelessWidget {
  const TopRatedMoviesRowList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TopRatedMoviesController _controller = TopRatedMoviesController();
    RxBool _isLoading = true.obs;

    _initialize() async {
      await _controller.fetchTopRatedMovies().whenComplete(() => _isLoading.value = false);
    }

    Timer.run(() => _initialize());

    return Obx(() {
      return FadeIn(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: 'Os mais votados - Brasil'),
            _isLoading.value
                ? const Center(child: CustomCircularProgressIndicator())
                : SectionRowList(moviesList: _controller.moviesList),
          ],
        ),
      );
    });
  }
}
