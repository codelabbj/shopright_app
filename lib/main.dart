import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:e_com_app/pages/Home/home_mobile_screen.dart';
import 'package:e_com_app/pages/authentification/login_screen.dart';
import 'package:e_com_app/pages/authentification/register_screen.dart';
import 'package:e_com_app/theme/app_dark_theme.dart';
import 'package:e_com_app/theme/app_light_theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  MyApp({super.key, required this.savedThemeMode});

  final kColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.white,
    primary: Color(0xFFFF5722),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      dark: AppDarkTheme,
      light: AppLightTheme,
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'E-Commerce App',
          theme: theme,
          darkTheme: darkTheme,
          home: HomeScreen(),
        );
      },
    );
  }
}
