
import 'package:case_app/utils/theme/custom_color_scheme.dart';
import 'package:case_app/utils/theme/custom_theme.dart';
import 'package:flutter/material.dart';

//Custom Dark Theme For Project Design
final class CustomDarkTheme extends CustomTheme {
  ThemeData get themeData => ThemeData(
        colorScheme: CustomColorScheme.darkColorScheme,
        floatingActionButtonTheme: floatingActionButtonThemeData,
      );

  @override
  FloatingActionButtonThemeData get floatingActionButtonThemeData =>
      const FloatingActionButtonThemeData();
}
