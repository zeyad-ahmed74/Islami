import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  static const String themeKey = "theme";
  final SharedPreferences prefs;

  ThemeProvider(this.prefs) {
    // read saved theme
    readSavedTheme();
  }

  void readSavedTheme() async {
    var isDarkEnabled = prefs.getBool(themeKey) ?? false;
    themeMode = isDarkEnabled ? ThemeMode.dark : ThemeMode.light;
  }

  void saveTheme() async {
    prefs.setBool(themeKey, isDark());
  }

  void changeThemeMode(ThemeMode newThemeMode) {
    themeMode = newThemeMode;
    notifyListeners();

    // save new language
    saveTheme();
  }

  bool isDark() {
    return themeMode == ThemeMode.dark;
  }

  static ThemeProvider get(BuildContext context) {
    return Provider.of<ThemeProvider>(context);
  }
}
