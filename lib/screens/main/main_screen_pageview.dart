import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/controllers/movie_genres_controller.dart';
import '/screens/all_movies/all_movies_screen.dart';
import '/screens/favorites/favorites_movies_screen.dart';
import '/screens/home/home_screen.dart';
import '/widgets/bottom_navigation_bar/moviefy_bottom_navigation_bar_widget.dart';

class MainScreenPageView extends StatelessWidget {
  const MainScreenPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController _pageController = Get.put(PageController(initialPage: 1), tag: 'main_page_controller');
    Get.put(MovieGenresController());

    return Scaffold(
      body: FadeIn(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            AllMoviesScreen(),
            HomeScreen(),
            FavoritesMoviesScreen(),
          ],
        ),
      ),
      bottomNavigationBar: const MoviefyBottomNavigationBarWidget(),
    );
  }
}
