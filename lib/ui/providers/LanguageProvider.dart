import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  String localCode = "ar";
  static const String localKey = "lang";
  final SharedPreferences prefs;

  LanguageProvider(this.prefs) {
    // read saved language
    readSavedLanguage();
  }

  void readSavedLanguage() async {
    localCode = prefs.getString(localKey) ?? "ar";
  }

  void saveLocal() async {
    prefs.setString(localKey, localCode);
  }

  void changeLanguage(String newLocalCode) {
    localCode = newLocalCode;
    notifyListeners();

    // save new language
    saveLocal();
  }

  bool isEnglish() {
    return localCode == "en";
  }

  static LanguageProvider get(BuildContext context) {
    return Provider.of<LanguageProvider>(context);
  }
}
