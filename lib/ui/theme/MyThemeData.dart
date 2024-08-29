import 'package:flutter/material.dart';

class MyThemeData {
  static const Color lightPrimaryColor = Color(0xFFB7935F);
  static const Color darkPrimaryColor = Color(0xFF141A2E);
  static const Color darkSecondaryColor = Color(0xFFFACC1D);

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    iconTheme: IconThemeData(
      color: lightPrimaryColor,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        centerTitle: true),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      // backgroundColor : Colors.black // not working so you must specify background color in every bottom navigation item
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      // here label color is same as item , this is not affected by selectedIConTheme
      selectedIconTheme: IconThemeData(size: 40.0),
      unselectedIconTheme: IconThemeData(size: 20.0),
      selectedLabelStyle: TextStyle(fontSize: 16.0),
    ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: lightPrimaryColor,
        primary: lightPrimaryColor,
        onPrimary: Colors.white,
        secondary: lightPrimaryColor,
        onSecondary: Colors.black,
        surface: Colors.white),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
    ),
    iconTheme: IconThemeData(
      color: darkPrimaryColor,
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true),
    colorScheme: ColorScheme.fromSeed(
        seedColor: darkPrimaryColor,
        primary: darkPrimaryColor,
        onPrimary: Colors.white,
        secondary: darkSecondaryColor,
        onSecondary: Colors.white),
  );
}
