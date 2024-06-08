import '../../../common_imports.dart';
import '../controllers/language_controller.dart';
import '../controllers/theme_controller.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});
  final languageController = Get.put(LanguageController());
  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("settings".tr),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              AppBottomSheet.bottomSheet(
                title: "app_language".tr,
                content: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: AppConstants.languages.length,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => RadioListTile(
                        visualDensity:
                            const VisualDensity(horizontal: 0, vertical: -4),
                        selected: languageController.localLanguage.value ==
                            AppConstants.languages[index][2],
                        title: Text(AppConstants.languages[index][1]),
                        subtitle: Text(
                            AppConstants.languages[index][0].toString().tr),
                        value: AppConstants.languages[index][2],
                        groupValue: languageController.localLanguage.value!,
                        onChanged: (val) => languageController
                            .setLanguage(AppConstants.languages[index][3]),
                      ),
                    );
                  },
                ),
              );
            },
            leading: const Icon(Icons.language),
            title: Text("app_language".tr),
            subtitle: Text(languageController.getLanguageName().tr),
          ),
          Obx(
            () => ListTile(
              onTap: () {
                themeController.themeModeTemp.value =
                    themeController.themeMode.value;
                AppDialog.dialog(
                  title: "choose_theme".tr,
                  content: ListView.builder(
                    shrinkWrap: true,
                    itemCount: AppConstants.themes.length,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => RadioListTile(
                          visualDensity:
                              const VisualDensity(horizontal: 0, vertical: -4),
                          title:
                              Text(AppConstants.themes[index][0].toString().tr),
                          value: AppConstants.themes[index][1],
                          groupValue: themeController.themeModeTemp.value,
                          onChanged: (dynamic value) {
                            themeController.themeModeTemp.value = value!;
                            themeController.themeModeIndexTemp.value = index;
                          },
                        ),
                      );
                    },
                  ),
                  onPressed: () {
                    themeController.setThemeMode();
                    Get.back();
                  },
                );
              },
              leading: const Icon(Icons.light_mode),
              title: Text("theme".tr),
              subtitle: Text(themeController.getThemeText().tr),
            ),
          ),
        ],
      ),
    );
  }
}
