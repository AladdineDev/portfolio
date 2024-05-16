import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart' as path;

class AppLocalizations {
  static const translationsPath = "assets/translations";

  static Future<List<Locale>> supportedLocales() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    List<String> assets = manifestMap.keys.where((String key) {
      return key.startsWith(translationsPath);
    }).toList();
    List<Locale> fileNames = assets.map((String asset) {
      final filenameLanguageCode = path.basenameWithoutExtension(asset);
      return Locale(filenameLanguageCode);
    }).toList();
    return fileNames;
  }
}
