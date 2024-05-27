import 'package:flutter/material.dart';
import 'package:flutter_template/common_imports.dart';

import '../../../common/controllers/language_controller.dart';
import '../../../common/controllers/theme_controller.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});
  final languageController = Get.put(LanguageController());
  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              Get.bottomSheet(
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: 5,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)),
                      width: Get.width / 4,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      visualDensity:
                          const VisualDensity(horizontal: 0, vertical: 0),
                      leading: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.close)),
                      title: const Text("App language"),
                    ).paddingSymmetric(horizontal: 10),
                    const Divider(
                      thickness: 0.1,
                      height: 0,
                      color: Colors.grey,
                    ),
                    Obx(
                      () => Column(
                        children: <Widget>[
                          RadioListTile(
                            visualDensity: const VisualDensity(
                                horizontal: 0, vertical: -4),
                            selected: languageController.localLanguage.value ==
                                AppConstants.enInLocal,
                            title: const Text("English"),
                            subtitle: Text("english".tr),
                            value: AppConstants.enInLocal,
                            groupValue: languageController.localLanguage.value!,
                            onChanged: (val) => languageController
                                .setLanguage(LanguageSetting.en),
                          ),
                          RadioListTile(
                            visualDensity: const VisualDensity(
                                horizontal: 0, vertical: -4),
                            selected: languageController.localLanguage.value ==
                                AppConstants.hiInLocal,
                            title: const Text("हिंदी"),
                            subtitle: Text("hindi".tr),
                            value: AppConstants.hiInLocal,
                            groupValue: languageController.localLanguage.value!,
                            onChanged: (val) => languageController
                                .setLanguage(LanguageSetting.hi),
                          ),
                          RadioListTile(
                            visualDensity: const VisualDensity(
                                horizontal: 0, vertical: -4),
                            selected: languageController.localLanguage.value ==
                                AppConstants.guInLocal,
                            title: const Text("ગુજરાતી"),
                            subtitle: Text("gujarati".tr),
                            value: AppConstants.guInLocal,
                            groupValue: languageController.localLanguage.value!,
                            onChanged: (val) => languageController
                                .setLanguage(LanguageSetting.gu),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 40)
                  ],
                ),
                backgroundColor: context.theme.bottomSheetTheme.backgroundColor,
              );
            },
            leading: const Icon(Icons.language),
            title: const Text("App language"),
            subtitle: Text(languageController.getLanguageName().tr),
          ),
          ListTile(
            onTap: () {
              themeController.themeModeTemp.value =
                  themeController.themeMode.value;
              Get.dialog(
                // title: "Choose Theme",
                Dialog(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Choose Theme",
                        style: TextStyle(fontSize: 22),
                      ).paddingSymmetric(vertical: 10, horizontal: 20),
                      Obx(
                        () => Column(
                          children: <Widget>[
                            RadioListTile(
                              visualDensity: const VisualDensity(
                                  horizontal: 0, vertical: -4),
                              title: const Text('Light'),
                              value: ThemeMode.light,
                              groupValue: themeController.themeModeTemp.value,
                              onChanged: (ThemeMode? value) {
                                themeController.themeModeTemp.value = value!;
                              },
                            ),
                            RadioListTile(
                              visualDensity: const VisualDensity(
                                  horizontal: 0, vertical: -4),
                              title: const Text('Dark'),
                              value: ThemeMode.dark,
                              groupValue: themeController.themeModeTemp.value,
                              onChanged: (ThemeMode? value) {
                                themeController.themeModeTemp.value = value!;
                              },
                            ),
                            RadioListTile(
                              visualDensity: const VisualDensity(
                                  horizontal: 0, vertical: -4),
                              title: const Text('System'),
                              value: ThemeMode.system,
                              groupValue: themeController.themeModeTemp.value,
                              onChanged: (ThemeMode? value) {
                                themeController.themeModeTemp.value = value!;
                              },
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text("Cancle"),
                          ),
                          TextButton(
                            onPressed: () {
                              themeController.setThemeMode();
                              Get.back();
                            },
                            child: const Text("Ok"),
                          )
                        ],
                      ).paddingSymmetric(horizontal: 15, vertical: 10)
                    ],
                  ),
                ),
              );
            },
            leading: const Icon(Icons.light_mode),
            title: const Text("Theme"),
            subtitle: Text(themeController.getThemeString()),
          )
        ],
      ),
    );
  }
}
