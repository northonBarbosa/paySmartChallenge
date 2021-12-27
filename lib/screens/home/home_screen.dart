import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '/widgets/appbar/moviefy_appbar.dart';
import '/utils/ui/colors.dart';
import '/widgets/cards/movie_card_section_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMoviefyBackgroundColor,
      body: CustomScrollView(
        slivers: [
          const MoviefyAppBar(
            title: 'Moviefy',
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Em alta',
                    style: GoogleFonts.anton(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.width * 0.38,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return MovieCardSectionWidget();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Northon's choice",
                    style: GoogleFonts.anton(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.width * 0.38,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return MovieCardSectionWidget();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Os mais votados",
                    style: GoogleFonts.anton(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.width * 0.38,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return MovieCardSectionWidget();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Somente nos cinemas",
                    style: GoogleFonts.anton(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.width * 0.38,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return MovieCardSectionWidget();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
