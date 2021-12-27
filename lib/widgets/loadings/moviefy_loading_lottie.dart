import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MoviefyLoadingLottie extends StatelessWidget {
  const MoviefyLoadingLottie({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/moviefy_loading_lottie.json',
        height: Get.width * 0.25,
        width: Get.width * 0.25,
      ),
    );
  }
}
