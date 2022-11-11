import 'package:countries_app/misc/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoText extends StatelessWidget {
  const LogoText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 80,
      child: Stack(
        children: [
          Text(
            "Explore",
            style: TextStyle(
              color: currentTheme.isDark
                  ? Colors.white
                  : Color.fromARGB(221, 7, 7, 7),
              fontSize: 28,
              fontFamily: GoogleFonts.pacifico().fontFamily,
            ),
          ),
          Positioned(
            top: 30,
            right: 18,
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
