import 'package:flutter/material.dart';
import 'package:islami/ui/theme/MyThemeData.dart';
import 'package:islami/ui/utils/DefaultScreen.dart';

class ChapterDetailsScreen extends StatelessWidget {
  static const String routeName = "chapterDetails";

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

    return DefaultScreen(
        body: Scaffold(
            appBar: AppBar(
              title: Text(
                args.title,
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
                              "سورة ${args.title}",
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
                        )
                      ],
                    )),
              ),
            )));
  }
}

bool checkIfLiteORDark(BuildContext context) {
  var brightness = MediaQuery.of(context).platformBrightness;
  return brightness == Brightness.dark;
}

class ChapterDetailsArgs {
  String title;
  int numOfAyat;

  ChapterDetailsArgs({required this.title, required this.numOfAyat});
}
