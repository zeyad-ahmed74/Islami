import 'package:flutter/material.dart';
import 'package:islami/ui/theme/MyThemeData.dart';

import 'HelpMethod.dart';

class DefaultScreen extends StatelessWidget {
  Widget body;

  DefaultScreen({required this.body, super.key});

  static const String routeName = 'defaultScreen';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          MyThemeData.isDark == false
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
