import '../../../common_imports.dart';

class ThemeController extends GetxController {
  var themeMode = ThemeMode.system.obs;
  var themeModeIndex = 0.obs;
  var themeModeIndexTemp = 0.obs;
  var themeModeTemp = ThemeMode.system.obs;
  GetStorage box = GetStorage();

  @override
  void onInit() {
    if (box.read(AppStorageKey.appTheme) == AppStorageKey.light) {
      themeMode.value = ThemeMode.light;
      themeModeIndex.value = 0;
    } else if (box.read(AppStorageKey.appTheme) == AppStorageKey.dark) {
      themeMode.value = ThemeMode.dark;
      themeModeIndex.value = 1;
    } else {
      themeMode.value = ThemeMode.system;
      themeModeIndex.value = 2;
    }
    super.onInit();
  }

  String getThemeText() {
    return AppConstants.themes[themeModeIndex.value][0];
  }

  void setThemeMode() {
    themeModeIndex.value = themeModeIndexTemp.value;
    themeMode.value = themeModeTemp.value;
    box.write(AppStorageKey.appTheme, themeMode.value.name);
  }
}
