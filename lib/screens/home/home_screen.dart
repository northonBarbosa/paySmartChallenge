import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviefy_app/controllers/trending_movies_controller.dart';
import 'package:moviefy_app/screens/home/components/northons_movies_row_list.dart';
import 'package:moviefy_app/screens/home/components/only_theaters_movies_row_list.dart';
import 'package:moviefy_app/screens/home/components/top_rated_row_list.dart';
import 'package:moviefy_app/screens/home/components/tranding_day_movies_row_list.dart';

import '/widgets/appbar/moviefy_appbar.dart';
import '/utils/ui/colors.dart';
import 'components/trending_movies_row_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  final TrendingMoviesController _trendingMoviesController = TrendingMoviesController();

  @override
  void initState() {
    initialize();
    super.initState();
  }

  initialize() async {
    await _trendingMoviesController.fetchTrendingMovies().whenComplete(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: kMoviefyBackgroundColor,
      body: FadeIn(
        child: CustomScrollView(
          slivers: [
            const MoviefyAppBar(
              title: 'Moviefy',
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                const [
                  TrendingMoviesRowList(),
                  TrendingDayMoviesRowList(),
                  NorthonsMoviesRowList(),
                  TopRatedMoviesRowList(),
                  OnlyTheatersMoviesRowList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
