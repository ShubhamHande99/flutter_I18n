import 'package:flutter/material.dart';

import '../../core/utils/utils.dart';
import '../../main.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalization.of(context)!.selectLanguage,
            style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Column(
        children: languages
            .map((e) => ListTile(
                  onTap: () {
                    languageNotifier.value = e['locale'];
                  },
                  title: Text(
                    e['name'],
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ))
            .toList(),
      ),
    );
  }
}
