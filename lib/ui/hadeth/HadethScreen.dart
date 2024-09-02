import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/hadeth/HadethTilteWidget.dart';
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

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          getFullImagePath("hadith_header.png"),
          fit: BoxFit.fitWidth,
        ),
        const Divider(
          thickness: 2.0,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            appTranslations(context).ahadeth,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const Divider(
          thickness: 2.0,
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
                        thickness: 2.0,
                      );
                    },
                    itemCount: Ahadeth.length,
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ))
      ],
        )
    );
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
