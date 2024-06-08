import '../common_imports.dart';

class AppConstants {
  static List localLanguageList = [
    Languages(lang: 'en', country: "IN"),
    Languages(lang: 'hi', country: "IN"),
    Languages(lang: 'gu', country: "IN"),
  ];
  static List languages = [
    ["english", "English", enInLocal, LanguageSetting.en],
    ["hindi", "हिंदी", hiInLocal, LanguageSetting.hi],
    ["gujarati", "ગુજરાતી", guInLocal, LanguageSetting.gu],
  ];
  static List themes = [
    ["light", ThemeMode.light],
    ["dark", ThemeMode.dark],
    ["system_default", ThemeMode.system],
  ];

  static Locale enInLocal = const Locale(AppStorageKey.en, AppStorageKey.IN);
  static Locale guInLocal = const Locale(AppStorageKey.gu, AppStorageKey.IN);
  static Locale hiInLocal = const Locale(AppStorageKey.hi, AppStorageKey.IN);
}
