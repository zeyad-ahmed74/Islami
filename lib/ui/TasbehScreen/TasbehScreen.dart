import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami/ui/utils/HelpMethod.dart';

class TasbehScreen extends StatefulWidget {
  static const String routeName = 'tasbehScreen';

  @override
  State<TasbehScreen> createState() => _TasbehScreenState();
}

class _TasbehScreenState extends State<TasbehScreen> {
  int counter = 0;

  double rotationAngle = 0;

  List<String> tasbehat = [
    "سبحان الله",
    "الحمد لله",
    "لا إله إلا الله",
    "الله اكبر",
    "لا حول ولا قوة إلا بالله",
    "اللهم صلي وبارك علي نبينا محمد"
  ];

  int tasbehIndex = 0;

  void _incrementAndCounterRotationAngle() {
    setState(() {
      counter++;
      rotationAngle += 11.5;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (counter >= 34) {
      counter = 0; // Reset counter
      tasbehIndex++; // Move to the next phrase
      if (tasbehIndex >= tasbehat.length) {
        // Loop back to the first phrase if reached the end
        tasbehIndex = 0;
      }
    }

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _incrementAndCounterRotationAngle,
              child: Align(
                alignment: Alignment.center,
                child: Transform.rotate(
                  angle: rotationAngle * pi / 180,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 45, top: 28),
                        child: Image.asset(
                          getFullImagePath("sebha_header.png"),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * .085,
                              bottom: 26),
                          child: Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              getFullImagePath("sebha.png"),
                              color: Theme.of(context).colorScheme.secondary,
                              height: 300,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              "عدد التسبيحات",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: 69.0,
              height: 60.0,
              child: Center(
                child: Text(
                  counter.toString(),
                    style: Theme.of(context).textTheme.bodySmall),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Theme.of(context).colorScheme.primary),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: 150.0,
              height: 50.0,
              child: Center(
                child: Text(
                  tasbehat[tasbehIndex],
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: Theme.of(context).colorScheme.secondary),
            ),
          ],
        ),
      ),
    );
  }
}
