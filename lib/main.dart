import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:e_com_app/pages/web/authentification/login_screen.dart';
import 'package:e_com_app/pages/web/dasboard/screen/dashboard_screen.dart';

import 'package:e_com_app/pages/web/orders/screens/list_orders_screen.dart';
import 'package:e_com_app/pages/web/product/screen/add_product_screen.dart';
import 'package:e_com_app/pages/web/product/screen/list_grid_product_screen.dart';
import 'package:e_com_app/pages/web/product/screen/product_web_screen.dart';
import 'package:e_com_app/routes/routes.dart';
import 'package:e_com_app/theme/app_colors.dart';

import 'package:e_com_app/theme/app_dark_theme.dart';
import 'package:e_com_app/theme/app_light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_strategy/url_strategy.dart';

import 'cubits/switch_page/switch_page_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  setPathUrlStrategy();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  MyApp({super.key, required this.savedThemeMode});

  final kColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.white,
    primary: Color(0xFF3BA3F2),
  );

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      dark: AppDarkTheme,
      light: AppLightTheme,
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) {
        return MultiBlocProvider(
            providers: [
              BlocProvider<SwitchPageCubit>(
                create: (context) => SwitchPageCubit(),
              ),
            ],
            child: Builder(builder: (context) {
              WidgetsBinding.instance.addPostFrameCallback((_) {});
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                routerConfig: AppRouter.router,
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
              );
            }));
      },
    );
  }
}
