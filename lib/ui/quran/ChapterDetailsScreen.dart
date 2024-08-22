import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/quran/VersesWidget.dart';
import 'package:islami/ui/theme/MyThemeData.dart';
import 'package:islami/ui/utils/DefaultScreen.dart';
import 'package:islami/ui/utils/HelpMethod.dart';

class ChapterDetailsScreen extends StatefulWidget {
  static const String routeName = "chapterDetails";

  @override
  State<ChapterDetailsScreen> createState() => _ChapterDetailsScreenState();
}

class _ChapterDetailsScreenState extends State<ChapterDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    Color mainColor;
    Color dividerColor;
    Color buttonsAndTextsColor;
    Color background;

    if (checkIfLiteORDark(context)) {
      mainColor = MyThemeData.darkPrimaryColor;
      buttonsAndTextsColor = mainColor;
      dividerColor = mainColor;
      background = mainColor;
    } else {
      mainColor = MyThemeData.lightPrimaryColor;
      buttonsAndTextsColor = Colors.black;
      dividerColor = mainColor;
      background = Colors.white;
    }

    var args = ModalRoute.of(context)?.settings.arguments as ChapterDetailsArgs;

    if (verses.isEmpty) {
      readChapterVerses(args.index);
    }

    return DefaultScreen(
        body: Scaffold(
            appBar: AppBar(
              title: Text(
                args.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32.0,
                  color: buttonsAndTextsColor,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Card(
                    color: background,
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "سورة ${args.name}",
                              style: TextStyle(
                                  fontSize: 32.0, color: buttonsAndTextsColor),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.play_circle),
                              color: buttonsAndTextsColor,
                              padding: EdgeInsets.only(left: 32.0),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Container(
                            width: double.maxFinite,
                            height: 1.0,
                            color: dividerColor,
                          ),
                        ),
                        Expanded(
                          child: verses.isNotEmpty
                              ? ListView.separated(
                                  itemBuilder: (context, index) {
                                    return VersesWidget(
                                        numOfVerse: index + 1,
                                        verse: verses[index]);
                                  },
                                  separatorBuilder: (context, index) {
                                    return Container(
                                      height: 1,
                                      width: double.maxFinite,
                                      color: MyThemeData.lightPrimaryColor,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 64.0),
                                    );
                                  },
                                  itemCount: verses.length)
                              : Center(child: CircularProgressIndicator()),
                        )
                      ],
                    )),
              ),
            )));
  }

  void readChapterVerses(int index) async {
    String sura = await rootBundle.loadString(getFullFilePath(index));
    List<String> lines = sura.trim().split("\n");
    print(lines);
    setState(() {
      verses = lines;
    });
  }
}

bool checkIfLiteORDark(BuildContext context) {
  var brightness = MediaQuery.of(context).platformBrightness;
  return brightness == Brightness.dark;
}

class ChapterDetailsArgs {
  int index;
  String name;

  ChapterDetailsArgs({required this.index, required this.name});
}
