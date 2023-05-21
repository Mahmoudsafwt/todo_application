import 'package:flutter/material.dart';
import 'package:todo_app/ui/colors/todo_app_colors.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: lightGreen,
      appBarTheme: AppBarTheme(color: primaryColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedIconTheme: IconThemeData(color: primaryColor, size: 34),
        unselectedIconTheme: IconThemeData(color: lightGrayColor, size: 34),
      ));
}
