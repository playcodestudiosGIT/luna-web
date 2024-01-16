import 'package:flutter/material.dart';

enum Language {
  en,
  es
}

class SettingsProvider extends ChangeNotifier {
  Language _language = Language.en;

  Language get language => _language;
  set language(Language value) {
    _language = value;
    notifyListeners();
  }
}
