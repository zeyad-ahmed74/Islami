import 'package:flutter/material.dart';
import 'package:islami/ui/hadeth/HadethScreen.dart';
import 'package:islami/ui/theme/MyThemeData.dart';
import 'package:islami/ui/utils/Ahadeth.dart';
import 'package:islami/ui/utils/DefaultScreen.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = "hadethDetailsScreen";

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

    var hadeth = ModalRoute.of(context)?.settings.arguments as Hadeth;

    return DefaultScreen(
        body: Scaffold(
            appBar: AppBar(
              title: Text(
                hadeth.title ?? "الحديث",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
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
                        Text(
                          hadeth.title ?? "الحديث",
                          style: TextStyle(
                              fontSize: 32.0, color: buttonsAndTextsColor),
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
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Text(
                                hadeth.body,
                                style: TextStyle(
                                  fontSize: 24.0,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            )));
  }

  bool checkIfLiteORDark(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark;
  }

  String getHadethBody(String hadethName) {
    var indexOfHadeth = Ahadeth.hadethName.indexOf(hadethName ?? "0");
    var hadethBody = Ahadeth.ahadeth[indexOfHadeth];

    return hadethBody;
  }
}
