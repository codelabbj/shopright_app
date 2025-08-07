import 'package:e_com_app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

final AppDarkTheme = ThemeData.dark().copyWith(
  useMaterial3: false,
  primaryColor: AppColors.PRIMARY_BLUE_COLOR,
  scaffoldBackgroundColor: const Color.fromARGB(255, 33, 33, 34),
  colorScheme: ColorScheme.dark(
    primary: AppColors.PRIMARY_BLUE_COLOR,
    secondary: Colors.grey[600]!,
    background: const Color.fromARGB(255, 33, 33, 34),
    surface: const Color(0xFF1E1E1E),
    error: Colors.red.shade400,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onBackground: Colors.white,
    onSurface: Colors.white,
    onError: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: const Color(0xFF1E1F28),
    centerTitle: true,
    elevation: 0,
    scrolledUnderElevation: 0,
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: GoogleFonts.albertSans(
      fontSize: 15,
      color: Colors.white,
      letterSpacing: 1.5,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: const Color.fromARGB(255, 33, 33, 34),
    selectedItemColor: AppColors.PRIMARY_BLUE_COLOR,
    unselectedItemColor: Colors.grey,
    selectedLabelStyle: GoogleFonts.albertSans(fontSize: 12, fontWeight: FontWeight.w500),
    unselectedLabelStyle: GoogleFonts.albertSans(fontSize: 12, fontWeight: FontWeight.w400),
    selectedIconTheme: const IconThemeData(size: 24, opacity: 1.0),
    unselectedIconTheme: const IconThemeData(size: 20, opacity: 0.8),
    showSelectedLabels: true,
    showUnselectedLabels: true,
    elevation: 8,
    type: BottomNavigationBarType.fixed,
    enableFeedback: true,
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.white)),
  ),
  textTheme: AppTextTheme.montserratTextTheme,
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF1E1E1E),
    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    labelStyle: GoogleFonts.albertSans(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),
    hintStyle: GoogleFonts.albertSans(fontSize: 12, fontWeight: FontWeight.w400, color: const Color(0xFFB8B8B8)),
    helperStyle: GoogleFonts.albertSans(fontSize: 15, fontWeight: FontWeight.w200, color: Colors.white),
    prefixStyle: const TextStyle(color: Colors.white),
    prefixIconColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.white),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFF194185), width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.red.shade800),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF194185),
      foregroundColor: Colors.white,
      minimumSize: const Size(1, 55),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Color(0xFF1E1F28),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Color.fromARGB(255, 33, 33, 34),
  ),
  listTileTheme: ListTileThemeData(
    titleTextStyle: GoogleFonts.albertSans(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.resolveWith((states) {
      return states.contains(MaterialState.selected) ? Colors.white : Colors.transparent;
    }),
    checkColor: MaterialStateProperty.all(const Color(0xFF1E1F28)),
    side: const BorderSide(color: Colors.white, width: 2),
  ),
  datePickerTheme: DatePickerThemeData(
    weekdayStyle: const TextStyle(color: Colors.white),
    todayBackgroundColor: MaterialStateProperty.all(Colors.white),
    yearForegroundColor: MaterialStateProperty.all(Colors.white),
    dayBackgroundColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.selected) ? Colors.white : Colors.transparent),
    headerBackgroundColor: Colors.white,
    rangeSelectionBackgroundColor: Colors.white,
    dayOverlayColor: MaterialStateProperty.all(Colors.white),
    cancelButtonStyle: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Colors.white),
      textStyle: MaterialStateProperty.all(GoogleFonts.albertSans(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)),
    ),
    confirmButtonStyle: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Colors.white),
      textStyle: MaterialStateProperty.all(GoogleFonts.albertSans(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)),
    ),
    dayForegroundColor: MaterialStateProperty.all(Colors.white),
    dayStyle: GoogleFonts.albertSans(fontSize: 19, color: Colors.white, fontWeight: FontWeight.w200),
  ),
);
