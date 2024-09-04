import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  void changeThemeMode(ThemeMode themeMode) {
    this.themeMode = themeMode;
    notifyListeners();
  }
}
