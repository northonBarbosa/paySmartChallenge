import 'package:flutter/material.dart';
import 'package:moviefy_app/utils/ui/colors.dart';
import 'package:moviefy_app/widgets/appbar/moviefy_appbar.dart';

class FavoritesMoviesScreen extends StatefulWidget {
  const FavoritesMoviesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesMoviesScreenState createState() => _FavoritesMoviesScreenState();
}

class _FavoritesMoviesScreenState extends State<FavoritesMoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kMoviefyBackgroundColor,
      body: CustomScrollView(
        slivers: [
          MoviefyAppBar(title: 'Favoritos'),
        ],
      ),
    );
  }
}
