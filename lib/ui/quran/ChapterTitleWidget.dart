import 'package:flutter/material.dart';
import 'package:islami/ui/quran/ChapterDetailsScreen.dart';

class ChapterTitleWidget extends StatelessWidget {
  int index;
  String name;
  int numOfAyat;

  ChapterTitleWidget(
      {required this.index, required this.name, required this.numOfAyat});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ChapterDetailsScreen.routeName,
            arguments: ChapterDetailsArgs(index: index, name: name));
      },
      child: Row(
        children: [
          Expanded(
              child: Text(
            numOfAyat.toString(),
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          )),
          Expanded(
              child: Text(
            name,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          )),
        ],
      ),
    );
  }
}
