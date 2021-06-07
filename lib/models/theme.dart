import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(ThemeData.dark());

  void setLightTheme() => emit(ThemeData.light());
  void setDarkTheme() => emit(ThemeData.dark());
  void toggleTheme() => state == ThemeData.light() ? setDarkTheme() : setLightTheme();

}