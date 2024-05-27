import '../common_imports.dart';

class AppConstants {
  static List localLanguageList = [
    Languages(lang: 'en', country: "IN"),
    Languages(lang: 'hi', country: "IN"),
    Languages(lang: 'gu', country: "IN"),
  ];

  static Locale enInLocal = const Locale(AppStorageKey.en, AppStorageKey.IN);
  static Locale guInLocal = const Locale(AppStorageKey.gu, AppStorageKey.IN);
  static Locale hiInLocal = const Locale(AppStorageKey.hi, AppStorageKey.IN);
}
