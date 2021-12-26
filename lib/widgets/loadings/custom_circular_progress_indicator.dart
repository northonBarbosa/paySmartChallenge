import 'package:flutter/material.dart';
import 'package:moviefy_app/utils/ui/colors.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      child: SizedBox(
        height: 35,
        child: CircularProgressIndicator(
          color: kMoviefyBlackCoral,
        ),
      ),
    );
  }
}
