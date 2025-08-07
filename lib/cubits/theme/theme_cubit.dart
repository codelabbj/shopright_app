import 'package:e_com_app/cubits/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(themeMode: ThemeMode.light));

  void toggleTheme() {
    emit(state.copyWith(
      themeMode: state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
    ));
  }

  void setLight() => emit(const ThemeState(themeMode: ThemeMode.light));
  void setDark() => emit(const ThemeState(themeMode: ThemeMode.dark));
}
