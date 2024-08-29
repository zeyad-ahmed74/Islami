import 'package:flutter/material.dart';
import 'package:islami/ui/theme/MyThemeData.dart';
import 'package:islami/ui/utils/HelpMethod.dart';

class BottomNavBarItem extends BottomNavigationBarItem {
  String? iconLabel;
  String? iconName;

  BottomNavBarItem({required this.iconLabel, required this.iconName})
      : super(
          icon: ImageIcon(AssetImage(getFullImagePath(iconName ?? ""))),
          label: iconLabel ?? "",
          backgroundColor: MyThemeData.lightPrimaryColor,
        );
}
