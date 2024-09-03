import 'package:flutter/material.dart';
import 'package:islami/ui/settings/modalBottomSheetItem.dart';
import 'package:islami/ui/utils/HelpMethod.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String selectedLanguage = "arabic";
  String selectedMode = "light";

  @override
  Widget build(BuildContext context) {
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
              _showLanguageModalButtonSheet(context);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24.0),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              width: double.maxFinite,
              child: Text(
                selectedLanguage,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
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
              _showModeModalButtonSheet(context);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24.0),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              width: double.maxFinite,
              child: Text(
                selectedMode,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 2.0)),
            ),
          ),
        ],
      ),
    );
  }

  void _showLanguageModalButtonSheet(BuildContext context) {
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
                        selectedLanguage = appTranslations(context).english;
                        Navigator.pop(context);
                      });
                    },
                    clickedOrNot:
                        selectedLanguage == appTranslations(context).english
                            ? true
                            : false,
                  ),
                  ModalBottomSheetItem(
                    text: appTranslations(context).arabic,
                    onBottomSheetItemClicked: (option) {
                      setState(() {
                        selectedLanguage = appTranslations(context).arabic;
                        Navigator.pop(context);
                      });
                    },
                    clickedOrNot:
                        selectedLanguage == appTranslations(context).arabic
                            ? true
                            : false,
                  )
                ],
              ),
            ),
          );
        });
  }

  void _showModeModalButtonSheet(BuildContext context) {
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
                        selectedMode = appTranslations(context).light;
                        Navigator.pop(context);
                      });
                    },
                    clickedOrNot:
                        selectedLanguage == appTranslations(context).light
                            ? true
                            : false,
                  ),
                  ModalBottomSheetItem(
                    text: appTranslations(context).dark,
                    onBottomSheetItemClicked: (option) {
                      setState(() {
                        selectedMode = appTranslations(context).dark;
                        Navigator.pop(context);
                      });
                    },
                    clickedOrNot:
                        selectedLanguage == appTranslations(context).dark
                            ? true
                            : false,
                  )
                ],
              ),
            ),
          );
        });
  }
}
