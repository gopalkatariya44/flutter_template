import 'package:get/get_navigation/get_navigation.dart';

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Languages extends Translations {
  static final Map<String, Map<String, String>> _translationMaps = {};

  // Asynchronous method to load JSON translation files.
  static Future<void> loadJsonData(String lang, String country) async {
    String jsonString =
        await rootBundle.loadString('assets/translations/$lang.json');
    final jsonResponse = json.decode(jsonString) as Map;

    final Map<String, String> stringMap = jsonResponse.map((key, value) {
      return MapEntry(key.toString(), value.toString());
    });
    _translationMaps['${lang}_$country'] = stringMap;
  }

  @override
  Map<String, Map<String, String>> get keys => _translationMaps;

  static Future<void> initTranslations() async {
    await loadJsonData('hi', 'IN');
    await loadJsonData('gu', 'IN');
    await loadJsonData('en', 'US');
  }
}
