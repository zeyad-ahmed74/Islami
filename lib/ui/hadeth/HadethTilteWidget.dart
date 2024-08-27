import 'package:flutter/material.dart';
import 'package:islami/ui/hadeth/HadethScreen.dart';

import 'HadethDetailsScreen.dart';

class HadethTilteWidget extends StatelessWidget {
  String title;

  String body;

  HadethTilteWidget({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetailsScreen.routeName,
            arguments: Hadeth(title: title, body: body));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
