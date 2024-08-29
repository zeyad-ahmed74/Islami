import 'package:flutter/material.dart';

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
          getFullImagePath("background.png"),
          fit: BoxFit.fill,
          width: double.maxFinite,
          height: double.maxFinite,
        ),
        body,
      ],
    );
  }
}
