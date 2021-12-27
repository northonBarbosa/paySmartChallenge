import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/utils/ui/colors.dart';
import '/widgets/buttons/search_button.dart';
import 'custom_sliver_appbar_widget.dart';

class MoviefyAppBar extends StatelessWidget {
  const MoviefyAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomSliverAppBar(
      leading: const SearchButton(),
      title: Text(
        title,
        style: GoogleFonts.anton(fontSize: 18),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: CircleAvatar(
            backgroundColor: kMoviefyPrimaryColor,
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
          ),
        ),
      ],
    );
  }
}
