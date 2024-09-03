import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami/ui/utils/HelpMethod.dart';

class BottomNavBarItem extends BottomNavigationBarItem {
  String iconLabel;
  String? iconName;
  Color? background;
  Icon? mainIcon;

  BottomNavBarItem({
    required this.iconLabel,
    this.iconName,
    this.background,
    this.mainIcon
  }) : super(
    icon: mainIcon ?? ImageIcon(AssetImage(getFullImagePath(iconName!))),
          label: iconLabel,
          backgroundColor: background,
        );
}
