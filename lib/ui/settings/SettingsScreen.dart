import 'package:flutter/material.dart';
import 'package:islami/ui/providers/LanguageProvider.dart';
import 'package:islami/ui/providers/ThemeProvider.dart';
import 'package:islami/ui/settings/modalBottomSheetItem.dart';
import 'package:islami/ui/theme/MyThemeData.dart';
import 'package:islami/ui/utils/HelpMethod.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);

    return Container(
      padding: EdgeInsets.all(16.0),
      width: double.maxFinite,
      height: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.0,
          ),
          Text(
            "${appTranslations(context).language} : ",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 30.0,
          ),
          InkWell(
            onTap: () {
              _showLanguageModalButtonSheet(context, languageProvider);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24.0),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              width: double.maxFinite,
              child: Text(
                isArabic(languageProvider)
                    ? appTranslations(context).arabic
                    : appTranslations(context).english,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              decoration: BoxDecoration(
                  color: isLight(themeProvider)
                      ? Colors.white
                      : MyThemeData.darkPrimaryColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                      color: isLight(themeProvider)
                          ? MyThemeData.lightPrimaryColor
                          : MyThemeData.darkSecondaryColor,
                      width: 2.0)),
            ),
          ),
          SizedBox(
            height: 70.0,
          ),
          Text(
            "${appTranslations(context).theme} : ",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 30.0,
          ),
          InkWell(
            onTap: () {
              _showThemeModalButtonSheet(context, themeProvider);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24.0),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              width: double.maxFinite,
              child: Text(
                isLight(themeProvider)
                    ? appTranslations(context).light
                    : appTranslations(context).dark,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              decoration: BoxDecoration(
                  color: isLight(themeProvider)
                      ? Colors.white
                      : MyThemeData.darkPrimaryColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                      color: isLight(themeProvider)
                          ? MyThemeData.lightPrimaryColor
                          : MyThemeData.darkSecondaryColor,
                      width: 2.0)),
            ),
          ),
        ],
      ),
    );
  }

  void _showLanguageModalButtonSheet(
      BuildContext context, LanguageProvider languageProvider) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            width: double.maxFinite,
            height: 250.0,
            child: Center(
              child: Column(
                children: [
                  ModalBottomSheetItem(
                    text: appTranslations(context).english,
                    onBottomSheetItemClicked: (option) {
                      setState(() {
                        languageProvider.changeLanguage('en');
                        Navigator.pop(context);
                      });
                    },
                  ),
                  ModalBottomSheetItem(
                    text: appTranslations(context).arabic,
                    onBottomSheetItemClicked: (option) {
                      setState(() {
                        languageProvider.changeLanguage('ar');
                        Navigator.pop(context);
                      });
                    },
                    // clickedOrNot: selectedLanguage == appTranslations(context).arabic ? true : false,
                  )
                ],
              ),
            ),
          );
        });
  }

  void _showThemeModalButtonSheet(
      BuildContext context, ThemeProvider themeProvider) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            width: double.maxFinite,
            height: 250.0,
            child: Center(
              child: Column(
                children: [
                  ModalBottomSheetItem(
                    text: appTranslations(context).light,
                    onBottomSheetItemClicked: (option) {
                      setState(() {
                        themeProvider.changeThemeMode(ThemeMode.light);
                        Navigator.pop(context);
                      });
                    },
                  ),
                  ModalBottomSheetItem(
                    text: appTranslations(context).dark,
                    onBottomSheetItemClicked: (option) {
                      setState(() {
                        themeProvider.changeThemeMode(ThemeMode.dark);
                        Navigator.pop(context);
                      });
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  bool isLight(ThemeProvider themeProvider) {
    return themeProvider.themeMode == ThemeMode.light;
  }

  bool isArabic(LanguageProvider languageProvider) {
    return languageProvider.localCode == "ar";
  }
}
