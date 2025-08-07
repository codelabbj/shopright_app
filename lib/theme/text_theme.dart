import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static TextTheme get montserratTextTheme => TextTheme(
        displayLarge: GoogleFonts.montserrat(
          fontSize: 19,
          color: Colors.black,
        ),
        displayMedium: GoogleFonts.montserrat(
          fontSize: 15,
          color: Colors.black,
        ),
        displaySmall: GoogleFonts.montserrat(
          fontSize: 11,
          color: Colors.black,
        ),
        labelLarge: GoogleFonts.montserrat(
          fontSize: 20,
          color: Colors.black,
        ),
        labelMedium: GoogleFonts.montserrat(
          fontSize: 17,
          color: Colors.black,
        ),
        labelSmall: GoogleFonts.montserrat(
          fontSize: 13,
          color: Colors.black,
        ),
        titleSmall: GoogleFonts.montserrat(
          fontSize: 8,
          color: Colors.black,
        ),
      );
}
