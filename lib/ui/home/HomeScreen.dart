import 'package:flutter/material.dart';
import 'package:islami/ui/TasbehScreen/TasbehScreen.dart';
import 'package:islami/ui/hadeth/HadethScreen.dart';
import 'package:islami/ui/home/BottomNavBarItem.dart';
import 'package:islami/ui/providers/ThemeProvider.dart';
import 'package:islami/ui/quran/QuranScreen.dart';
import 'package:islami/ui/radio/RadioScreen.dart';
import 'package:islami/ui/settings/SettingsScreen.dart';
import 'package:islami/ui/theme/MyThemeData.dart';
import 'package:islami/ui/utils/DefaultScreen.dart';
import 'package:islami/ui/utils/HelpMethod.dart';
import 'package:provider/provider.dart';

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
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return DefaultScreen(
      body: Scaffold(
        appBar: AppBar(
          title: Text(
            appTranslations(context).appTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        bottomNavigationBar: Theme(
          // we wrapping bottom nav bar with Theme to set background for it .
          data: Theme.of(context).copyWith(
            canvasColor: themeProvider.themeMode == ThemeMode.light
                ? MyThemeData.lightPrimaryColor
                : MyThemeData.darkPrimaryColor,
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
                iconLabel: appTranslations(context).quranTab,
                // we can replace this way with wrapping the widget with theme and set canvas color instead of setting background for every bottom nav bar item
                // background: Theme.of(context).colorScheme.primary
              ),
              BottomNavBarItem(
                iconName: "ic_hadeth.png",
                iconLabel: appTranslations(context).hadethTab,
                // background: Theme.of(context).colorScheme.primary
              ),
              BottomNavBarItem(
                iconName: "ic_sebha.png",
                iconLabel: appTranslations(context).tasbehTab,
                // background: Theme.of(context).colorScheme.primary
              ),
              BottomNavBarItem(
                iconName: "ic_radio.png",
                iconLabel: appTranslations(context).radioTab,
                // background: Theme.of(context).colorScheme.primary
              ),
              BottomNavBarItem(
                mainIcon: Icon(Icons.settings),
                iconLabel: appTranslations(context).settingsTab,
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
