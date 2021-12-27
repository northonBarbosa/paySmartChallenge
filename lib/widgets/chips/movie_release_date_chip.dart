import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '/utils/ui/colors.dart';

class MovieReleaseDateChip extends StatelessWidget {
  const MovieReleaseDateChip({
    Key? key,
    required this.releaseDate,
    this.fontSize = 12,
  }) : super(key: key);

  final String releaseDate;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: const BoxDecoration(
        color: kMoviefyBlackCoral,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 3.0),
            child: Icon(
              SimpleLineIcons.calendar,
              color: kMoviefyDesertSand,
              size: fontSize,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            releaseDate.isNotEmpty ? DateFormat('dd/MM/yyyy').format(DateTime.parse(releaseDate)) : '-/-/-',
            style: GoogleFonts.comfortaa(
              color: kMoviefyDesertSand,
              height: 1.1,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
