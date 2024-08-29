import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String getFullImagePath(String imageName) {
  return "assets/images/$imageName";
}

String getFullFilePath(int index) {
  return "assets/files/${index + 1}.txt";
}

AppLocalizations appTranslations(BuildContext context) {
  return AppLocalizations.of(context)!;
}