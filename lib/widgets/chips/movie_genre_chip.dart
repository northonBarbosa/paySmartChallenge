import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/utils/ui/colors.dart';

class MovieGenreChip extends StatelessWidget {
  const MovieGenreChip({
    Key? key,
    required this.label,
    this.fontSize = 11,
    this.labelPadding,
  }) : super(key: key);

  final String label;
  final double fontSize;
  final EdgeInsetsGeometry? labelPadding;

  @override
  Widget build(BuildContext context) {
    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      backgroundColor: kMoviefyPrimaryColor,
      elevation: 2,
      side: const BorderSide(
        color: kMoviefyDesertSand,
        width: 1.1,
      ),
      label: Text(label),
      labelStyle: GoogleFonts.comfortaa(
        color: Colors.white,
        fontSize: fontSize,
      ),
      labelPadding: labelPadding,
      visualDensity: VisualDensity.compact,
    );
  }
}
