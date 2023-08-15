import 'package:flutter/widgets.dart';

class AppLocalizations {
  static const supportedLocales = [
    Locale('en'),
    Locale('fr'),
  ];

  static const path = "assets/translations";

  static final fallbackLocale = supportedLocales.first;
}
