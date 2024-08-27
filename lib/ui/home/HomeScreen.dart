import 'package:flutter/material.dart';
import 'package:islami/ui/TasbehScreen/TasbehScreen.dart';
import 'package:islami/ui/hadeth/HadethScreen.dart';
import 'package:islami/ui/home/BottomNavBarItem.dart';
import 'package:islami/ui/quran/QuranScreen.dart';
import 'package:islami/ui/radio/RadioScreen.dart';
import 'package:islami/ui/theme/MyThemeData.dart';
import 'package:islami/ui/utils/DefaultScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = "homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  var tabs = [
    QuranScreen(),
    HadethScreen(),
    TasbehScreen(),
    RadioScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      body: Scaffold(
        appBar: AppBar(
          title: Text(
            "Islami",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        bottomNavigationBar: Theme(
          // we wrapping bottom nav bar with Theme to set background for it .
          data: Theme.of(context).copyWith(
            canvasColor: MyThemeData.isDark == true
                ? MyThemeData.darkPrimaryColor
                : MyThemeData.lightPrimaryColor,
          ),
          child: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            currentIndex: selectedIndex,
            items: [
              BottomNavBarItem(
                iconName: "ic_quran.png",
                iconLabel: "quran",
                // we can replace this way with wrapping the widget with theme and set canvas color instead of setting background for every bottom nav bar item
                // background: Theme.of(context).colorScheme.primary
              ),
              BottomNavBarItem(
                iconName: "ic_hadeth.png",
                iconLabel: "hadeth",
                // background: Theme.of(context).colorScheme.primary
              ),
              BottomNavBarItem(
                iconName: "ic_sebha.png",
                iconLabel: "sebha",
                // background: Theme.of(context).colorScheme.primary
              ),
              BottomNavBarItem(
                iconName: "ic_radio.png",
                iconLabel: "radio",
                // background: Theme.of(context).colorScheme.primary
              ),
            ],
          ),
        ),
        body: tabs[selectedIndex],
      ),
    );
  }
}
