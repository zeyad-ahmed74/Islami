import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/hadeth/HadethTilteWidget.dart';
import 'package:islami/ui/theme/MyThemeData.dart';
import 'package:islami/ui/utils/HelpMethod.dart';

class HadethScreen extends StatefulWidget {
  static const String routeName = "hadethScreen";

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<Hadeth> Ahadeth = [];

  @override
  void initState() {
    super.initState();
    readAhadethHeaders();
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
            child: Ahadeth.isNotEmpty
                ? ListView.separated(
                    itemBuilder: (context, index) {
                      return HadethTilteWidget(
                          title: Ahadeth[index].title,
                          body: Ahadeth[index].body);
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: dividerColor,
                        thickness: 2.0,
                      );
                    },
                    itemCount: Ahadeth.length,
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ))
          ],
        )
    );
  }

  bool checkIfLiteORDark(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark;
  }

  void readAhadethHeaders() async {
    String fileContent =
        await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> ahadeth = fileContent.split('#');
    for (int i = 0; i < ahadeth.length; i++) {
      String singleHadeth = ahadeth[i];
      List<String> lines = singleHadeth.trim().split("\n");
      String title = lines[0];
      lines.removeAt(0);
      String hadethContent = lines.join("\n");
      Hadeth hadeth = Hadeth(title: title, body: hadethContent);
      Ahadeth.add(hadeth);
      print(hadethContent);
    }

    setState(() {});
  }
}

class Hadeth {
  String title;
  String body;

  Hadeth({required this.title, required this.body});
}
