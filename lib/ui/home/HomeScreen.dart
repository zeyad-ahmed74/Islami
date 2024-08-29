import 'package:flutter/material.dart';
import 'package:islami/ui/TasbehScreen/TasbehScreen.dart';
import 'package:islami/ui/hadeth/HadethScreen.dart';
import 'package:islami/ui/home/BottomNavBarItem.dart';
import 'package:islami/ui/quran/QuranScreen.dart';
import 'package:islami/ui/radio/RadioScreen.dart';
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
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: TextStyle(color: Colors.black),
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          currentIndex: selectedIndex,
          items: [
            BottomNavBarItem(iconName: "ic_quran.png", iconLabel: "quran"),
            BottomNavBarItem(iconName: "ic_hadeth.png", iconLabel: "hadeth"),
            BottomNavBarItem(iconName: "ic_sebha.png", iconLabel: "sebha"),
            BottomNavBarItem(iconName: "ic_radio.png", iconLabel: "radio"),
          ],
        ),
        body: tabs[selectedIndex],
      ),
    );
  }
}
