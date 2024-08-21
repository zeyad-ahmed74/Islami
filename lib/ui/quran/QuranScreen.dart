import 'package:flutter/material.dart';
import 'package:islami/ui/quran/ChapterDetailsScreen.dart';
import 'package:islami/ui/quran/ChapterTitle.dart';
import 'package:islami/ui/theme/MyThemeData.dart';
import 'package:islami/ui/utils/ChaptersNameAndVersesNumber.dart';
import 'package:islami/ui/utils/HelpMethod.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  static const String routeName = "quranScreen";

  @override
  Widget build(BuildContext context) {
    Color dividerColor;
    if (checkIfLiteORDark(context)) {
      dividerColor = MyThemeData.darkPrimaryColor;
    } else {
      dividerColor = MyThemeData.lightPrimaryColor;
    }

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
                Center(
                  child: Container(
                    width: 2.0,
                    height: double.maxFinite,
                    color: dividerColor,
                  ),
                ),
                Column(
                  children: [
                    Divider(
                      color: dividerColor,
                      thickness: 2.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Ayat",
                            style:
                                TextStyle(color: Colors.black, fontSize: 24.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Chapter Name",
                            style:
                                TextStyle(color: Colors.black, fontSize: 24.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: dividerColor,
                      thickness: 2.0,
                    ),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) => ChapterTitle(
                              ChaptersNameAndVersesNumber.chaptersName[index],
                              ChaptersNameAndVersesNumber.versesNumber[index]),
                          separatorBuilder: (context, index) {
                            return Divider(
                              color: dividerColor,
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

  bool checkIfLiteORDark(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark;
  }
}
