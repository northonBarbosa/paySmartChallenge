import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '/widgets/bottom_navigation_bar/moviefy_bottom_navigation_bar_widget.dart';
import '/utils/ui/colors.dart';
import '/widgets/bottom_navigation_bar/bottom_navigation_bar_controller.dart';

class MainScreenPageView extends StatelessWidget {
  const MainScreenPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarController _bottomNavController = Get.put(BottomNavigationBarController());
    PageController _pageController = Get.put(PageController(), tag: 'main_page_controller');

    return Scaffold(
      body: FadeIn(
        child: PageView(
          controller: _pageController,
          onPageChanged: (page) {
            _bottomNavController.currentIndex.value = page;
          },
          children: [
            Container(
              color: kMoviefyPrimaryColor,
              child: const Center(
                child: Icon(
                  Feather.film,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
            Container(
              color: kMoviefyPrimaryColor,
              child: const Center(
                child: Icon(
                  Feather.home,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
            Container(
              color: kMoviefyPrimaryColor,
              child: const Center(
                child: Icon(
                  Feather.heart,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const MoviefyBottomNavigationBarWidget(),
    );
  }
}