import 'package:flutter/material.dart';

class AppTheme {
  // Определение основных цветов темы приложения
  static final pinkTheme = ThemeData(
    primaryColor: Colors.pink,
    buttonTheme: ButtonThemeData(buttonColor: Colors.pinkAccent),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(color: Colors.pink),
  );

  static final yellowTheme = ThemeData(
    primaryColor: Colors.yellow,
    buttonTheme: ButtonThemeData(buttonColor: Colors.yellowAccent),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(color: Colors.yellow),
  );

  static final greenTheme = ThemeData(
    primaryColor: Colors.green,
    buttonTheme: ButtonThemeData(buttonColor: Colors.greenAccent),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(color: Colors.green),
  );

  static ThemeData getThemeByName(String colorName) {
    switch (colorName) {
      case 'Розовый':
        return pinkTheme;
      case 'Жёлтый':
        return yellowTheme;
      case 'Зелёный':
        return greenTheme;
      default:
        return pinkTheme;
    }
  }
}
