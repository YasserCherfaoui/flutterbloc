
import 'package:flutter/material.dart';
import 'package:flutterbloc/core/theme/app_pallete.dart';

class AppTheme {
  static _border([Color color = AppPallete.borderColor]) =>  OutlineInputBorder(
        borderSide:  BorderSide(
          color: color,
          width: 3.0
        ),
        borderRadius: BorderRadius.circular(10.0)
      );
  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    inputDecorationTheme:  InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder:_border(),
      focusedBorder: _border(AppPallete.gradient1),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPallete.backgroundColor
    )
  );
  static final lightTheme = ThemeData.light();
}
