import 'package:bookly/features/splash/constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: kPrimaryColor,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        backgroundColor: Colors.transparent,
      ),
      textTheme: const TextTheme(
          bodySmall: TextStyle(fontSize: 18, color: Colors.white)));
}
