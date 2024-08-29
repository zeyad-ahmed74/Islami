import 'package:flutter/material.dart';
import 'package:islami/ui/quran/ChapterTitleWidget.dart';
import 'package:islami/ui/utils/ChaptersNameAndVersesNumber.dart';
import 'package:islami/ui/utils/HelpMethod.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  static const String routeName = "quranScreen";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Expanded(
        child: Column(
          children: [
            Image.asset(getFullImagePath("quran_header_icn.png")),
            SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Center(
                    child: VerticalDivider(
                      thickness: 2.0,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Divider(
                      thickness: 2.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            appTranslations(context).numOfAyat,
                            style: Theme.of(context).textTheme.titleSmall,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            appTranslations(context).chapterTitle,
                            style: Theme.of(context).textTheme.titleSmall,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 2.0,
                    ),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) => ChapterTitleWidget(
                                index: index,
                                name: ChaptersNameAndVersesNumber
                                    .chaptersName[index],
                                numOfAyat: ChaptersNameAndVersesNumber
                                    .versesNumber[index],
                              ),
                          separatorBuilder: (context, index) {
                            return Divider(
                              thickness: 2.0,
                            );
                          },
                          itemCount:
                              ChaptersNameAndVersesNumber.chaptersName.length),
                    ),
                  ],
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }

}
