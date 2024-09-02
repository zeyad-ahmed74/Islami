import 'package:flutter/material.dart';
import 'package:islami/ui/quran/ChapterTitleWidget.dart';
import 'package:islami/ui/utils/ChaptersNameAndVersesNumber.dart';
import 'package:islami/ui/utils/HelpMethod.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  static const String routeName = "quranScreen";

  @override
  Widget build(BuildContext context) {
    Locale currentLocal = Localizations.localeOf(context);

    return Scaffold(
      body: Expanded(
        child: Column(
          children: [
            Image.asset(getFullImagePath("quran_header_icn.png")),
            const SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: Stack(children: [
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Center(
                    child: VerticalDivider(
                      thickness: 2.0,
                    ),
                  ),
                ),
                Column(
                  children: [
                    const Divider(
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
                    const Divider(
                      thickness: 2.0,
                    ),
                    Expanded(
                      child: currentLocal.toString() == "en"
                          ? ListView.separated(
                              itemBuilder: (context, index) => ChapterTitleWidget(
                                    index: index,
                                    name: ChaptersNameAndVersesNumber
                                        .chaptersNameEnglish[index],
                                    numOfAyat: ChaptersNameAndVersesNumber
                                        .versesNumber[index],
                                  ),
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  thickness: 2.0,
                            );
                          },
                          itemCount: ChaptersNameAndVersesNumber
                                  .chaptersNameEnglish.length)
                          : ListView.separated(
                              itemBuilder: (context, index) =>
                                  ChapterTitleWidget(
                                    index: index,
                                    name: ChaptersNameAndVersesNumber
                                        .chaptersNameArabic[index],
                                    numOfAyat: ChaptersNameAndVersesNumber
                                        .versesNumber[index],
                                  ),
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  thickness: 2.0,
                                );
                              },
                              itemCount: ChaptersNameAndVersesNumber
                                  .chaptersNameArabic.length),
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
