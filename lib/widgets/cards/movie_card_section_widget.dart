import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviefy_app/utils/ui/colors.dart';

class MovieCardSectionWidget extends StatelessWidget {
  const MovieCardSectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: Container(
        height: Get.width * 0.35,
        width: Get.width * 0.55,
        margin: const EdgeInsets.only(right: 10, bottom: 15),
        decoration: BoxDecoration(
          border: Border.all(
            color: kMoviefyPrimaryColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: kMoviefyBlackCoral.withOpacity(0.5),
              blurRadius: 4,
              spreadRadius: 2,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              Image(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1584956861988-913b8c1c7270?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
                fit: BoxFit.cover,
                width: Get.width * 0.55,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: Get.width * 0.55,
                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 8),
                  decoration: BoxDecoration(
                    color: kMoviefyBlackCoral.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Homem-Aranha: Sem Volta Pra Casa',
                    style: GoogleFonts.nunito(
                        fontSize: Get.width * 0.027,
                        height: 1.1,
                        color: kMoviefyDesertSand,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
