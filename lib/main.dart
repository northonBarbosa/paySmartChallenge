import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviefy_app/utils/ui/colors.dart';

import 'screens/main/main_screen_pageview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Moviefy',
      theme: ThemeData(
        backgroundColor: kMoviefyBackgroundColor,
        primaryColor: kMoviefyPrimaryColor,
      ),
      home: const MainScreenPageView(),
    );
  }
}
