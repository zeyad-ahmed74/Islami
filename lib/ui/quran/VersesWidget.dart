import 'package:flutter/material.dart';

class VersesWidget extends StatelessWidget {
  int numOfVerse;
  String verse;

  VersesWidget({required this.numOfVerse, required this.verse});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "$verse{$numOfVerse}",
            style: TextStyle(
              fontSize: 25.0,
            ),
            locale: Locale("ar"),
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
