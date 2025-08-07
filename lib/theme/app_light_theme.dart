import 'package:e_com_app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final AppLightTheme = ThemeData.light().copyWith(
  useMaterial3: true,
  primaryColor: const Color(0xFF194185),
  scaffoldBackgroundColor: const Color(0xFFF9F9F9),
  colorScheme: ColorScheme.light(
    primary: const Color(0xFF194185),
    secondary: Colors.grey[600]!,
    background: const Color(0xFFF9F9F9),
    surface: Colors.white,
    error: Colors.red[700]!,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onBackground: Colors.black,
    onSurface: Colors.black,
    onError: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    centerTitle: true,
  ),
  textTheme: AppTextTheme.montserratTextTheme,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFECEFF1),
    selectedItemColor: Color(0xFF194185),
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    elevation: 8.0,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
    labelStyle: const TextStyle(color: Colors.black87),
    hintStyle: const TextStyle(color: Colors.black54),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.yellow[800]!),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.yellow[800]!),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.yellow[800]!, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.red.shade800),
    ),
    prefixIconColor: Colors.black,
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.all(Colors.black),
    checkColor: MaterialStateProperty.all(Colors.white),
    side: const BorderSide(color: Colors.black, width: 2),
  ),
  listTileTheme: const ListTileThemeData(
    textColor: Colors.black,
    iconColor: Colors.black,
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Color(0xFFF0F0F0),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF194185),
      foregroundColor: Colors.white,
      minimumSize: const Size(1, 55),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
);
