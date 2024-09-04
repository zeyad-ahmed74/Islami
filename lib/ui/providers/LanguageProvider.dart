import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String localCode = "ar";

  void changeLanguage(String localCode) {
    this.localCode = localCode;
    notifyListeners();
  }
}
