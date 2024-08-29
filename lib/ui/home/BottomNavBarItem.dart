import 'package:flutter/material.dart';
import 'package:islami/ui/utils/HelpMethod.dart';

class BottomNavBarItem extends BottomNavigationBarItem {
  String iconLabel;
  String iconName;
  Color? background;

  BottomNavBarItem(
      {required this.iconLabel, required this.iconName, this.background})
      : super(
          icon: ImageIcon(AssetImage(getFullImagePath(iconName))),
          label: iconLabel,
          backgroundColor: background,
        );
}
