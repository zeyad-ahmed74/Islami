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

    var args = ModalRoute.of(context)?.settings.arguments as ChapterDetailsArgs;

    if (verses.isEmpty) {
      readChapterVerses(args.index);
    }
    return DefaultScreen(
        body: Scaffold(
            appBar: AppBar(
              title: Text(
                args.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            body: Card(
                margin: EdgeInsets.symmetric(vertical: 64, horizontal: 24),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "سورة ${args.name}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 48.0),
                      child: Divider(
                        thickness: 2.0,
                        height: 1,
                      ),
                    ),
                    Expanded(
                      child: verses.isNotEmpty
                          ? ListView.separated(
                              itemBuilder: (context, index) {
                                return VersesWidget(
                                    numOfVerse: index, verse: verses[index]);
                              },
                              separatorBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 1,
                                    width: double.infinity,
                                    color: MyThemeData.lightPrimaryColor,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 64.0),
                                  ),
                                );
                              },
                              itemCount: verses.length)
                          : Center(child: CircularProgressIndicator()),
                    ),
                  ],
                ))));
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

class ChapterDetailsArgs {
  int index;
  String name;

  ChapterDetailsArgs({required this.index, required this.name});
}
