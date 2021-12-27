import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/widgets/loadings/custom_circular_progress_indicator.dart';
import '/controllers/trending_movies_controller.dart';
import '/widgets/home_sections/section_row_list.dart';
import '/widgets/home_sections/section_title.dart';

class TrendingMoviesRowList extends StatelessWidget {
  const TrendingMoviesRowList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TrendingMoviesController _controller = TrendingMoviesController();
    RxBool _isLoading = true.obs;

    _initialize() async {
      await _controller.fetchTrendingMovies().whenComplete(() => _isLoading.value = false);
    }

    Timer.run(() => _initialize());

    return Obx(() {
      return FadeIn(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: 'Em Alta'),
            _isLoading.value
                ? const Center(child: CustomCircularProgressIndicator())
                : SectionRowList(moviesList: _controller.moviesList),
          ],
        ),
      );
    });
  }
}
