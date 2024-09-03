import 'package:flutter/material.dart';

class MyThemeData {
  static const Color lightPrimaryColor = Color(0xFFB7935F);
  static const Color darkPrimaryColor = Color(0xFF141A2E);
  static const Color darkSecondaryColor = Color(0xFFFACC1D);
  static bool isDark = true;

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    textTheme: TextTheme(
      titleMedium:
          TextStyle(fontFamily: 'Messiri', fontSize: 30.0, color: Colors.black),
      titleSmall:
          TextStyle(fontFamily: 'Messiri', fontSize: 25.0, color: Colors.black),
      bodyMedium:
          TextStyle(fontFamily: 'Inter', fontSize: 25.0, color: Colors.black),
      bodySmall:
          TextStyle(fontFamily: 'Inter', fontSize: 20.0, color: Colors.black),
        labelMedium: TextStyle(
            fontFamily: 'Poppins', fontSize: 16.0, color: lightPrimaryColor),
      ),
    iconTheme: IconThemeData(
      color: lightPrimaryColor,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
    ),
    dividerTheme: DividerThemeData(color: lightPrimaryColor),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    buttonTheme: ButtonThemeData(buttonColor: lightPrimaryColor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      // backgroundColor : Colors.black // not working so you must specify background color in every bottom navigation item
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      // here label color is same as item , this is not affected by selectedIConTheme
      selectedIconTheme: IconThemeData(size: 40.0),
      unselectedIconTheme: IconThemeData(size: 20.0),
      selectedLabelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
    ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: lightPrimaryColor,
        primary: lightPrimaryColor,
        onPrimary: Colors.white,
        secondary: lightPrimaryColor,
        onSecondary: Colors.black,
        surface: Colors.white),
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: darkPrimaryColor));

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    textTheme: TextTheme(
      titleMedium:
          TextStyle(fontFamily: 'Messiri', fontSize: 30.0, color: Colors.white),
      titleSmall:
          TextStyle(fontFamily: 'Messiri', fontSize: 25.0, color: Colors.white),
      bodyMedium:
          TextStyle(fontFamily: 'Inter', fontSize: 25.0, color: Colors.white),
      bodySmall:
          TextStyle(fontFamily: 'Inter', fontSize: 20.0, color: Colors.white),
        labelMedium: TextStyle(
            fontFamily: 'Poppins', fontSize: 16.0, color: darkSecondaryColor),
      ),
    buttonTheme: ButtonThemeData(buttonColor: lightPrimaryColor),
    dividerTheme: DividerThemeData(color: darkSecondaryColor),
    cardTheme: CardTheme(
      color: darkPrimaryColor,
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkPrimaryColor,
      selectedItemColor: darkSecondaryColor,
      unselectedItemColor: Colors.white,
      // here label color is same as item , this is not affected by selectedIConTheme
      selectedIconTheme: IconThemeData(size: 40.0),
      unselectedIconTheme: IconThemeData(size: 20.0),
      selectedLabelStyle: TextStyle(fontSize: 16.0, color: darkSecondaryColor),
    ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: darkPrimaryColor,
        primary: darkPrimaryColor,
        onPrimary: Colors.black,
        secondary: darkSecondaryColor,
        onSecondary: Colors.black,
        surface: Colors.white),
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: lightPrimaryColor));
}
