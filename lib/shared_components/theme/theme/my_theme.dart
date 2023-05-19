import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/shared_components/theme/theme/color.dart';

class MyTheme {
  static ThemeData LightTheme = ThemeData(
    primaryColor: Colors.white,
    accentColor: Colors.black,
    backgroundColor: lightGreenColor,
    scaffoldBackgroundColor: lightGreenColor,
    appBarTheme: AppBarTheme(
        color: primaryColor,
        centerTitle: false,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: primaryColor,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedIconTheme: IconThemeData(color: primaryColor, size: 34),
        unselectedIconTheme:
            const IconThemeData(color: Color(0XFFC8C9CB), size: 32),
        selectedItemColor: primaryColor),
    textTheme: TextTheme(
      headlineMedium: GoogleFonts.poppins(
          color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
      bodyMedium: GoogleFonts.poppins(
          color: primaryColor, fontSize: 18, fontWeight: FontWeight.w600),
      bodySmall: GoogleFonts.roboto(
          color: Colors.black, fontSize: 15, fontWeight: FontWeight.normal),
    ),
  );
  static ThemeData DarkTheme = ThemeData(
    primaryColor: Colors.black,
    accentColor: Colors.white,
    backgroundColor: blueBlack,
    scaffoldBackgroundColor: blueBlack,
    appBarTheme: AppBarTheme(
        color: primaryColor,
        centerTitle: false,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: primaryColor,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedIconTheme: IconThemeData(color: primaryColor, size: 34),
        unselectedIconTheme: const IconThemeData(color: Colors.white, size: 32),
        selectedItemColor: primaryColor),
    textTheme: TextTheme(
      headlineMedium: GoogleFonts.poppins(
          color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
      bodyMedium: GoogleFonts.poppins(
          color: primaryColor, fontSize: 18, fontWeight: FontWeight.w600),
      bodySmall: GoogleFonts.roboto(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal),
    ),
  );
}
