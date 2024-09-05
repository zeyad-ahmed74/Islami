import 'package:flutter/material.dart';

import '../providers/ThemeProvider.dart';
import 'HelpMethod.dart';

class DefaultScreen extends StatelessWidget {
  Widget body;

  DefaultScreen({required this.body, super.key});

  static const String routeName = 'defaultScreen';

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = ThemeProvider.get(context);

    return Stack(
      children: [
        Image.asset(
          themeProvider.themeMode == ThemeMode.light
              ? getFullImagePath("light_main_bg.png")
              : getFullImagePath("dark_main_bg.png"),
          fit: BoxFit.fill,
          width: double.maxFinite,
          height: double.maxFinite,
        ),
        body,
      ],
    );
  }
}
