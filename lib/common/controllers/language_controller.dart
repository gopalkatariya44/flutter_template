import '/common_imports.dart';

class LanguageController extends GetxController {
  var localLanguage = Get.deviceLocale.obs;
  var box = GetStorage();

  @override
  void onInit() {
    if (box.read(AppStorageKey.appLanguage) == AppStorageKey.en) {
      localLanguage.value = const Locale(AppStorageKey.en, AppStorageKey.US);
    } else if (box.read(AppStorageKey.appLanguage) == AppStorageKey.hi) {
      localLanguage.value = const Locale(AppStorageKey.hi, AppStorageKey.IN);
    } else if (box.read(AppStorageKey.appLanguage) == AppStorageKey.gu) {
      localLanguage.value = const Locale(AppStorageKey.gu, AppStorageKey.IN);
    } else {
      localLanguage.value = Get.deviceLocale;
    }
    super.onInit();
  }

  void setLanguage(LanguageSetting mode) {
    switch (mode) {
      case LanguageSetting.en:
        localLanguage.value = const Locale(AppStorageKey.en, AppStorageKey.US);
        box.write(AppStorageKey.appLanguage, AppStorageKey.en);
        break;
      case LanguageSetting.hi:
        localLanguage.value = const Locale(AppStorageKey.hi, AppStorageKey.IN);
        box.write(AppStorageKey.appLanguage, AppStorageKey.hi);
        break;
      case LanguageSetting.gu:
        localLanguage.value = const Locale(AppStorageKey.gu, AppStorageKey.IN);
        box.write(AppStorageKey.appLanguage, AppStorageKey.gu);
        break;
    }
    Get.updateLocale(localLanguage.value as Locale);
  }
}
