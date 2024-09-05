import 'package:flutter/material.dart';
import 'package:islami/ui/home/HomeScreen.dart';
import 'package:islami/ui/providers/ThemeProvider.dart';
import 'package:islami/ui/utils/HelpMethod.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String routeName = 'splashScreen';

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = ThemeProvider.get(context);

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });

    return Stack(
      children: [
        Image.asset(
          themeProvider.themeMode == ThemeMode.light
              ? getFullImagePath("splash_light_bg.png")
              : getFullImagePath("splash_dark_bg.png"),
          width: double.maxFinite,
          height: double.maxFinite,
          fit: BoxFit.fill,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 10,
              child: Container(
                width: double.maxFinite,
                height: 300.0,
                child: Image.asset(themeProvider.themeMode == ThemeMode.light
                    ? getFullImagePath("light_splash_logo.png")
                    : getFullImagePath("dark_splash_logo.png")),
              ),
            ),
            Expanded(
                flex: 2,
                child: Image.asset(
                  themeProvider.themeMode == ThemeMode.light
                      ? getFullImagePath("light_route_logo.png")
                      : getFullImagePath("dark_route_logo.png"),
                  color: Theme.of(context).colorScheme.secondary,
                )),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(bottom: 24.0),
                child: Text("Supervised by Zeyad Ahmed",
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary)),
              ),
            )
          ],
        ),
      ],
    );
  }

}
