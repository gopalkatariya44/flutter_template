import '../../common_imports.dart';

class ThemeController extends GetxController {
  var themeMode = ThemeMode.system.obs;
  GetStorage box = GetStorage();

  @override
  void onInit() {
    if (box.read(AppStorageKey.appTheme) == AppStorageKey.dark) {
      themeMode.value = ThemeMode.dark;
    } else if (box.read(AppStorageKey.appTheme) == AppStorageKey.light) {
      themeMode.value = ThemeMode.light;
    } else {
      themeMode.value = ThemeMode.system;
    }
    super.onInit();
  }

  void setThemeMode(ThemeModeSetting mode) {
    switch (mode) {
      case ThemeModeSetting.light:
        themeMode.value = ThemeMode.light;
        box.write(AppStorageKey.appTheme, AppStorageKey.light);
        break;
      case ThemeModeSetting.dark:
        themeMode.value = ThemeMode.dark;
        box.write(AppStorageKey.appTheme, AppStorageKey.dark);
        break;
      case ThemeModeSetting.system:
        themeMode.value = ThemeMode.system;
        box.write(AppStorageKey.appTheme, AppStorageKey.system);
        break;
    }
  }
}
