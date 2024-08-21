import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:islami/ui/home/HomeScreen.dart';
import 'package:islami/ui/theme/MyThemeData.dart';
import 'package:islami/ui/utils/HelpMethod.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String routeName = 'splashScreen';

  @override
  Widget build(BuildContext context) {
    var color;
    if (checkIfLiteORDark(context)) {
      color = MyThemeData.darkPrimaryColor;
    } else {
      color = Colors.white;
    }

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    return Scaffold(
      backgroundColor: color,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 10,
            child: Container(
              width: double.maxFinite,
              height: 300.0,
              child: Image.asset(getFullImagePath("splash_image.png")),
            ),
          ),
          Expanded(
              flex: 2, child: Image.asset(getFullImagePath("routegold.png"))),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: Text(
                "Supervised by Zeyad Ahmed",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffB7935F),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  bool checkIfLiteORDark(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark;
  }
}
