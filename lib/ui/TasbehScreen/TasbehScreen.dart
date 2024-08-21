import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami/ui/theme/MyThemeData.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              fit: BoxFit.fill,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              "عدد التسبيحات",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
            ),
            Container(
              width: 69.0,
              height: 60.0,
              child: Center(
                child: Text(
                  counter.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 25.0,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: MyThemeData.lightPrimaryColor),
            ),
            Container(
              width: 150.0,
              child: Text(
                tasbehat[tasbehIndex],
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 25.0,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: MyThemeData.lightPrimaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
