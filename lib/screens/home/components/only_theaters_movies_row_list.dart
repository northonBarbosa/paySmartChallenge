import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/controllers/only_theaters_movies_controller.dart';
import '/widgets/loadings/custom_circular_progress_indicator.dart';
import '/widgets/home_sections/section_row_list.dart';
import '/widgets/home_sections/section_title.dart';

class OnlyTheatersMoviesRowList extends StatelessWidget {
  const OnlyTheatersMoviesRowList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OnlyTheatersMoviesController _controller = OnlyTheatersMoviesController();
    RxBool _isLoading = true.obs;

    _initialize() async {
      await _controller.fetchOnlyTheatersMovies().whenComplete(() => _isLoading.value = false);
    }

    Timer.run(() => _initialize());

    return Obx(() {
      return FadeIn(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: 'Somente nos cinemas'),
            _isLoading.value
                ? const Center(child: CustomCircularProgressIndicator())
                : SectionRowList(moviesList: _controller.moviesList),
          ],
        ),
      );
    });
  }
}
