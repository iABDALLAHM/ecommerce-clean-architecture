import 'package:ecommerce_clean_architecture/core/cubits/change_theme_cubit/change_theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(ChangeThemeState(currentTheme: ThemeMode.light));

  void toggleTheme() {
    if (state.currentTheme == ThemeMode.light) {
      emit(ChangeThemeState(currentTheme: ThemeMode.dark));
    } else if (state.currentTheme == ThemeMode.dark) {
      emit(ChangeThemeState(currentTheme: ThemeMode.light));
    }
  }
}
