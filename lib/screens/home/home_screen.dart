import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviefy_app/utils/ui/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: <Color>[Colors.white, Colors.blueGrey, Colors.blue],
            ),
          ),
        ),
        actions: const [
          CircleAvatar(
            backgroundColor: Colors.amber,
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Em alta',
              style: GoogleFonts.anton(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 90,
            width: Get.width,
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.8),
              itemBuilder: (context, index) {
                index % 5;

                return Container(
                  color: kMoviefyBlackCoral,
                  height: 80,
                  child: Center(
                    child: Column(
                      children: [
                        const Icon(Icons.movie_outlined),
                        Text('Northon ${index % 5}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Northon's choice",
              style: GoogleFonts.anton(
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Os mais votados",
              style: GoogleFonts.anton(
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Somente nos cinemas",
              style: GoogleFonts.anton(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
