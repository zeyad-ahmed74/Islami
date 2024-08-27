import 'package:flutter/material.dart';
import 'package:islami/ui/hadeth/HadethScreen.dart';
import 'package:islami/ui/utils/DefaultScreen.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = "hadethDetailsScreen";

  @override
  Widget build(BuildContext context) {

    var hadeth = ModalRoute.of(context)?.settings.arguments as Hadeth;

    return DefaultScreen(
        body: Scaffold(
            appBar: AppBar(
              title: Text(
                hadeth.title ?? "الحديث",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            body: Card(
                margin: EdgeInsets.symmetric(vertical: 64, horizontal: 24),
                child: Column(
                  children: [
                    Text(
                      hadeth.title ?? "الحديث",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 64.0),
                      child: Divider(
                        thickness: 2.0,
                        height: 1.0,
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
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                    )
                  ],
                ))));
  }


}
