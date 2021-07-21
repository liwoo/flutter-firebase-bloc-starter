import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(ThemeMode theme) : super(theme);

  void changeTheme(ThemeMode theme) => emit(theme);
}
