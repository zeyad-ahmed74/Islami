import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/ui/hadeth/HadethDetailsScreen.dart';
import 'package:islami/ui/home/HomeScreen.dart';
import 'package:islami/ui/providers/LanguageProvider.dart';
import 'package:islami/ui/providers/ThemeProvider.dart';
import 'package:islami/ui/quran/ChapterDetailsScreen.dart';
import 'package:islami/ui/splash/SplashScreen.dart';
import 'package:islami/ui/theme/MyThemeData.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) {
          return ThemeProvider();
        },
      ),
      ChangeNotifierProvider(
        create: (context) {
          return LanguageProvider();
        },
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);

    return MaterialApp(
      title: "Islami",
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: themeProvider.themeMode,
      locale: Locale(languageProvider.localCode),
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        ChapterDetailsScreen.routeName: (_) => ChapterDetailsScreen(),
        HadethDetailsScreen.routeName: (_) => HadethDetailsScreen(),
      },
      initialRoute: SplashScreen.routeName,

      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      //
      // supportedLocales: [
      //   Locale('en'), // English
      //   Locale('ar'), // Arabic
      // ],

    );
  }
}
