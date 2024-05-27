import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import '../../common_imports.dart';

class Languages extends Translations {
  final String? lang;
  final String? country;
  Languages({this.lang, this.country});

  static final Map<String, Map<String, String>> _translationMaps = {};

  // Asynchronous method to load JSON translation files.
  static Future<void> loadJsonData(String lang, String country) async {
    String jsonString =
        await rootBundle.loadString('${AppFiles.translations}/$lang.json');
    final jsonResponse = json.decode(jsonString) as Map;

    final Map<String, String> stringMap = jsonResponse.map((key, value) {
      return MapEntry(key.toString(), value.toString());
    });
    _translationMaps['${lang}_$country'] = stringMap;
  }

  @override
  Map<String, Map<String, String>> get keys => _translationMaps;

  static Future<void> initTranslations() async {
    for (var element in AppConstants.localLanguageList) {
      await loadJsonData(element.lang, element.country);
    }
  }
}
