import 'package:e_com_app/pages/Home/home_mobile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final kColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.white,
    primary: Color(0xFFFF5722),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFCFCFC),
        ),
        scaffoldBackgroundColor: const Color(0xFFFCFCFC),
        colorScheme: kColorScheme,
        textTheme: const TextTheme().copyWith(
          displayLarge: GoogleFonts.montserrat(
            fontSize: 19,
            color: Colors.black,
          ),
          labelLarge: GoogleFonts.montserrat(
            fontSize: 20,
            color: Colors.black,
          ),
          displayMedium: GoogleFonts.montserrat(
            fontSize: 15,
            color: Colors.black,
          ),
          labelSmall: GoogleFonts.montserrat(
            fontSize: 13,
            color: Colors.black,
          ),
          displaySmall: GoogleFonts.montserrat(
            fontSize: 11,
            color: Colors.black,
          ),
          labelMedium: GoogleFonts.montserrat(
            fontSize: 17,
            color: Colors.black,
          ),
          titleSmall: GoogleFonts.montserrat(
            fontSize: 8,
            color: Colors.black,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
