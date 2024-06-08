import '/common_imports.dart';

class LanguageController extends AppController {
  // if you modify the list add Language jason to assets/translations/

  var localLanguage = Get.deviceLocale.obs;
  var box = GetStorage();

  String getLanguageName() {
    switch (localLanguage.value!.languageCode) {
      case AppStorageKey.en:
        return 'english';
      case AppStorageKey.hi:
        return 'hindi';
      case AppStorageKey.gu:
        return 'gujarati';
    }
    return "";
  }

  void setLanguage(LanguageSetting mode) {
    switch (mode) {
      case LanguageSetting.en:
        localLanguage.value = AppConstants.enInLocal;
        box.write(AppStorageKey.appLanguage, AppStorageKey.en);
        break;
      case LanguageSetting.hi:
        localLanguage.value = AppConstants.hiInLocal;
        box.write(AppStorageKey.appLanguage, AppStorageKey.hi);
        break;
      case LanguageSetting.gu:
        localLanguage.value = AppConstants.guInLocal;
        box.write(AppStorageKey.appLanguage, AppStorageKey.gu);
        break;
    }
    Get.updateLocale(localLanguage.value!);
    Get.back();
  }

  @override
  void onInit() {
    if (box.read(AppStorageKey.appLanguage) == AppStorageKey.en) {
      localLanguage.value = AppConstants.enInLocal;
    } else if (box.read(AppStorageKey.appLanguage) == AppStorageKey.hi) {
      localLanguage.value = AppConstants.hiInLocal;
    } else if (box.read(AppStorageKey.appLanguage) == AppStorageKey.gu) {
      localLanguage.value = AppConstants.guInLocal;
    } else {
      localLanguage.value = Get.deviceLocale;
      box.write(AppStorageKey.appLanguage, AppStorageKey.en);
    }
    super.onInit();
  }
}
