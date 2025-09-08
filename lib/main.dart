import 'package:e_com_app/cubit/theme_cubit.dart';
import 'package:e_com_app/theme/app_theme.dart';
import 'package:e_com_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_strategy/url_strategy.dart';

import 'cubits/switch_page/switch_page_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(
    BlocProvider(
      create: (_) => ThemeCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(builder: (context, themeMode) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<SwitchPageCubit>(
            create: (context) => SwitchPageCubit(),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          routerConfig: AppRouter.router,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
        ),
      );
    });
  }
}
