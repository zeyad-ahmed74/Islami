import 'package:flutter/material.dart';
import 'package:islami/ui/utils/HelpMethod.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  static const String routeName = 'radioScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          getFullImagePath("radio.png"),
          fit: BoxFit.fitWidth,
        ),
        SizedBox(
          height: 60.0,
        ),
        Text(
          "إذاعة القرآن الكريم",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          height: 60.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.skip_previous,
              size: 32.0,
            ),
            Icon(
              Icons.play_arrow,
              size: 48.0,
            ),
            Icon(
              Icons.skip_next,
              size: 32.0,
            ),
          ],
        )
      ],
    ));
  }
}
