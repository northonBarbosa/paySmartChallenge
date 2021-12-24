import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '/utils/ui/colors.dart';
import '/widgets/bottom_navigation_bar/bottom_navigation_bar_controller.dart';

class MoviefyBottomNavigationBarWidget extends StatelessWidget {
  const MoviefyBottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarController _bottomNavController = Get.find();
    PageController _pageController = Get.find(tag: 'main_page_controller');

    return Obx(() {
      return BottomNavigationBar(
        currentIndex: _bottomNavController.currentIndex.value,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        fixedColor: kMoviefyBlackCoral,
        backgroundColor: kMoviefyDesertSand,
        selectedLabelStyle: const TextStyle(
          fontSize: 0,
        ),
        onTap: (item) {
          _bottomNavController.currentIndex.value = item;
          _pageController.jumpToPage(item);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Feather.film,
              color: kMoviefyLightBrown,
            ),
            activeIcon: Icon(
              Feather.film,
              color: kMoviefyPrimaryColor,
              size: 28,
            ),
            label: '-',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Feather.home,
              color: kMoviefyLightBrown,
            ),
            activeIcon: Icon(
              Feather.home,
              color: kMoviefyPrimaryColor,
              size: 28,
            ),
            label: '-',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Feather.heart,
              color: kMoviefyLightBrown,
            ),
            activeIcon: Icon(
              Feather.heart,
              color: kMoviefyPrimaryColor,
              size: 28,
            ),
            label: '-',
          ),
        ],
      );
    });
  }
}
