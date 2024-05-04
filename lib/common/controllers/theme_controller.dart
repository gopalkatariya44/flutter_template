import '../../common_imports.dart';

class ThemeController extends GetxController {
  var themeMode = ThemeMode.system.obs;
  GetStorage box = GetStorage();

  @override
  void onInit() {
    if (box.read(AppConstants.appTheme) == AppConstants.dark) {
      themeMode.value = ThemeMode.dark;
    } else if (box.read(AppConstants.appTheme) == AppConstants.light) {
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
        box.write(AppConstants.appTheme, AppConstants.light);
        break;
      case ThemeModeSetting.dark:
        themeMode.value = ThemeMode.dark;
        box.write(AppConstants.appTheme, AppConstants.dark);
        break;
      case ThemeModeSetting.system:
        themeMode.value = ThemeMode.system;
        box.write(AppConstants.appTheme, AppConstants.system);
        break;
    }
  }
}
