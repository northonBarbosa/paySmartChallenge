import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviefy_app/utils/ui/colors.dart';

class MovieFavoriteButton extends StatefulWidget {
  const MovieFavoriteButton({
    Key? key,
    required this.onTap,
    this.fontSize = 12,
  }) : super(key: key);

  final Function() onTap;
  final double fontSize;

  @override
  State<MovieFavoriteButton> createState() => _MovieFavoriteButtonState();
}

class _MovieFavoriteButtonState extends State<MovieFavoriteButton> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap;
        _isFavorite = !_isFavorite;
        setState(() {});
      },
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: Get.width * 0.003),
              child: Icon(
                _isFavorite ? FontAwesome.heart : FontAwesome.heart_o,
                color: _isFavorite ? Colors.red : kMoviefyBlackCoral,
                size: widget.fontSize,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              'Favoritar',
              style: GoogleFonts.comfortaa(
                color: kMoviefyBlackCoral,
                height: 1.1,
                fontSize: widget.fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
