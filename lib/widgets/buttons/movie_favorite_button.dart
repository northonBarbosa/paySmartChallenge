import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviefy_app/utils/ui/colors.dart';

class MovieFavoriteButton extends StatelessWidget {
  const MovieFavoriteButton({
    Key? key,
    required this.onTap,
    this.fontSize = 12,
  }) : super(key: key);

  final Function() onTap;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 5,
        ),
        margin: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          color: kMoviefyDesertSand,
          border: Border.all(color: kMoviefyBlackCoral, width: 1),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Icon(
                SimpleLineIcons.heart,
                color: kMoviefyBlackCoral,
                size: fontSize,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              'Favoritar',
              style: GoogleFonts.comfortaa(
                color: kMoviefyBlackCoral,
                height: 1.1,
                fontSize: fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
