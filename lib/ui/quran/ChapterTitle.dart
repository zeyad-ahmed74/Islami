import 'package:flutter/material.dart';
import 'package:islami/ui/quran/ChapterDetailsScreen.dart';

class ChapterTitle extends StatelessWidget {
  String title;
  int numOfAyat;

  ChapterTitle(this.title, this.numOfAyat);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ChapterDetailsScreen.routeName,
            arguments: ChapterDetailsArgs(title: title, numOfAyat: numOfAyat));
      },
      child: Row(
        children: [
          Expanded(
              child: Text(
            numOfAyat.toString(),
            style: TextStyle(
              fontSize: 25.0,
            ),
            textAlign: TextAlign.center,
          )),
          Expanded(
              child: Text(
            title,
            style: TextStyle(
              fontSize: 25.0,
            ),
            textAlign: TextAlign.center,
          )),
        ],
      ),
    );
  }
}
