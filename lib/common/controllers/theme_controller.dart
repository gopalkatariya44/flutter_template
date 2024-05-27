import '../../common_imports.dart';

class ThemeController extends GetxController {
  var themeMode = ThemeMode.system.obs;
  var themeModeTemp = ThemeMode.system.obs;
  GetStorage box = GetStorage();

  @override
  void onInit() {
    if (box.read(AppStorageKey.appTheme) == AppStorageKey.dark) {
      themeMode.value = ThemeMode.dark;
    } else if (box.read(AppStorageKey.appTheme) == AppStorageKey.light) {
      themeMode.value = ThemeMode.light;
    } else {
      themeMode.value = ThemeMode.system;
      box.write(AppStorageKey.appTheme, AppStorageKey.system);
    }
    super.onInit();
  }

  String getThemeString() {
    return box.read(AppStorageKey.appTheme);
  }

  void setThemeMode() {
    switch (themeModeTemp.value) {
      case ThemeMode.light:
        themeMode.value = ThemeMode.light;
        box.write(AppStorageKey.appTheme, AppStorageKey.light);
        break;
      case ThemeMode.dark:
        themeMode.value = ThemeMode.dark;
        box.write(AppStorageKey.appTheme, AppStorageKey.dark);
        break;
      case ThemeMode.system:
        themeMode.value = ThemeMode.system;
        box.write(AppStorageKey.appTheme, AppStorageKey.system);
        break;
    }
  }
}
