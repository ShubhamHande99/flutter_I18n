import 'dart:io';
import 'package:flutter/material.dart';

import 'presentation/screens/screens.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

List<Map> languages = [
  {'name': 'English', 'locale': 'en'},
  {'name': 'हिंदी (Hindi)', 'locale': 'hi'},
  {'name': 'मराठी (Marathi)', 'locale': 'mr'},
  {'name': 'ಕನ್ನಡ (Kannada)', 'locale': 'kn'},
  {'name': 'عربي (Arabic)', 'locale': 'ar'},
  {'name': 'Española (Spanish)', 'locale': 'es'},
];

late ValueNotifier languageNotifier;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    languageNotifier = ValueNotifier(
      Platform.localeName.substring(0, 2),
    );
    super.initState();
  }

  @override
  void dispose() {
    languageNotifier.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: languageNotifier,
      builder: (context, value, _) {
        return MaterialApp(
          title: 'Flutter l18n',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(value),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
            useMaterial3: true,
          ),
          home: const Settings(),
        );
      },
    );
  }
}
