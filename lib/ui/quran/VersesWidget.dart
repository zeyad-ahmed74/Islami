import 'package:flutter/material.dart';

class VersesWidget extends StatelessWidget {
  int numOfVerse;
  String verse;

  VersesWidget({required this.numOfVerse, required this.verse});

  @override
  Widget build(BuildContext context) {
    debugPrint("$verse {${numOfVerse + 1}}");
    return Text(
      "${verse.trim()} {${numOfVerse + 1}}",
      style: Theme.of(context).textTheme.bodySmall,
      locale: Locale("ar"),
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    );
  }
}
