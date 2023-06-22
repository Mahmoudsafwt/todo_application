import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/ui/colors/todo_app_colors.dart';

class MyTheme {
  static Color unSelectedDay = Colors.black;
  static Color unSelectedMonth = Colors.black;
  static Color backgroundDays = Colors.white;
  static ThemeData lightTheme = ThemeData(
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.poppins(
            color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        bodyMedium: GoogleFonts.poppins(
            color: primaryColor, fontSize: 18, fontWeight: FontWeight.bold),
        bodySmall: GoogleFonts.roboto(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal),
      ),
      scaffoldBackgroundColor: lightGreen,
      appBarTheme: AppBarTheme(color: primaryColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedIconTheme: IconThemeData(color: primaryColor, size: 34),
        unselectedIconTheme: IconThemeData(color: lightGrayColor, size: 34),
      ));
  static ThemeData darkTheme = ThemeData(
      textTheme: TextTheme(
    bodyLarge: GoogleFonts.poppins(
        color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
    bodyMedium: GoogleFonts.poppins(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
    bodySmall: GoogleFonts.roboto(
        color: Colors.white, fontSize: 14, fontWeight: FontWeight.normal),
  ));
}
