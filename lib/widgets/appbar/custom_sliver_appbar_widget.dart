import 'package:flutter/material.dart';
import 'package:moviefy_app/utils/ui/colors.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key? key,
    this.leading,
    this.title,
    this.actions,
  }) : super(key: key);

  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: leading,
      title: title,
      centerTitle: true,
      floating: true,
      backgroundColor: kMoviefyBlackCoral,
      actions: actions,
    );
  }
}
