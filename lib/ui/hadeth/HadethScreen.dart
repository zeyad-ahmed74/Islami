import 'package:flutter/material.dart';
import 'package:islami/ui/hadeth/HadethDetailsScreen.dart';
import 'package:islami/ui/theme/MyThemeData.dart';
import 'package:islami/ui/utils/Ahadeth.dart';
import 'package:islami/ui/utils/HelpMethod.dart';

class HadethScreen extends StatelessWidget {
  static const String routeName = "hadethScreen";
  List<String> ahadethNames = [];

  HadethScreen() {
    for (int i = 0; i < 2605; i++) {
      ahadethNames.add("الحديث رقم ${i + 1}");
    }
  }

  @override
  Widget build(BuildContext context) {
    Color dividerColor;
    if (checkIfLiteORDark(context)) {
      dividerColor = MyThemeData.darkPrimaryColor;
    } else {
      dividerColor = MyThemeData.lightPrimaryColor;
    }
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          getFullImagePath("hadith_header.png"),
          fit: BoxFit.fitWidth,
        ),
        Container(
          width: double.maxFinite,
          height: 2.0,
          color: dividerColor,
        ),
        Text(
          "الأحاديث",
          style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600),
        ),
        Container(
          width: double.maxFinite,
          height: 2.0,
          color: dividerColor,
        ),
        Expanded(
            child: ListView.separated(
          itemBuilder: (context, index) {
            return HadethWidget(context, Ahadeth.hadethName[index], index);
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: dividerColor,
              thickness: 2.0,
            );
          },
          itemCount: Ahadeth.hadethName.length,
        ))
      ],
    ));
  }

  Widget HadethWidget(BuildContext context, String name, int index) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetailsScreen.routeName,
            arguments: name);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 32.0,
            ),
          ),
        ],
      ),
    );
  }

  bool checkIfLiteORDark(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark;
  }
}
