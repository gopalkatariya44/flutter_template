import 'package:flutter_template/common/controllers/language_controller.dart';

import '/common/controllers/theme_controller.dart';

import '../common_imports.dart';

class UserProvider extends GetConnect {
  Future<Response> getUser(int id) =>
      get("https://api.restful-api.dev/objects");
  createUser(data) => post("https://api.restful-api.dev/objects", data);
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  GetStorage box = GetStorage();
  final themeController = Get.put(ThemeController());
  final languageController = Get.put(LanguageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title".tr),
      ),
      body: Column(
        children: [
          // SizedBox(
          //   width: Get.width / 1.2,
          //   child: ElevatedButton(
          //     onPressed: () {},
          //     child: const Text("bottom bar"),
          //   ),
          // ),
          // FloatingActionButton(
          //   onPressed: () {},
          //   child: const Icon(Icons.add),
          // ),
          // TextFormField(),
          // OutlinedButton(onPressed: () {}, child: const Text("HEY oiuutline")),
          // const CloseButton(),
          // FilledButton(onPressed: () {}, child: const Text("data")),
          // const BackButton(),
          // IconButton(onPressed: () {}, icon: const Icon(Icons.mobile_friendly)),
          // const DrawerButton(),
          // TextButton(
          //   onPressed: () {
          //     Get.toNamed('/details');
          //   },
          //   child: const Text("Detail page"),
          // ),
          Obx(
            () => Column(
              children: <Widget>[
                ListTile(
                  title: const Text('Light'),
                  leading: Radio<ThemeMode>(
                    value: ThemeMode.light,
                    groupValue: themeController.themeMode.value,
                    onChanged: (ThemeMode? value) {
                      themeController.setThemeMode(ThemeModeSetting.light);
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Dark'),
                  leading: Radio<ThemeMode>(
                    value: ThemeMode.dark,
                    groupValue: themeController.themeMode.value,
                    onChanged: (ThemeMode? value) {
                      themeController.setThemeMode(ThemeModeSetting.dark);
                    },
                  ),
                ),
                ListTile(
                  title: const Text('System'),
                  leading: Radio<ThemeMode>(
                    value: ThemeMode.system,
                    groupValue: themeController.themeMode.value,
                    onChanged: (ThemeMode? value) {
                      themeController.setThemeMode(ThemeModeSetting.system);
                    },
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => Column(
              children: <Widget>[
                ListTile(
                  title: const Text('EN'),
                  leading: Radio<Locale>(
                    value: const Locale(AppStorageKey.en, AppStorageKey.US),
                    groupValue: languageController.localLanguage.value,
                    onChanged: (Locale? value) {
                      languageController.setLanguage(LanguageSetting.en);
                    },
                  ),
                ),
                ListTile(
                  title: const Text('HI'),
                  leading: Radio<Locale>(
                    value: const Locale(AppStorageKey.hi, AppStorageKey.IN),
                    groupValue: languageController.localLanguage.value,
                    onChanged: (Locale? value) {
                      languageController.setLanguage(LanguageSetting.hi);
                    },
                  ),
                ),
                ListTile(
                  title: const Text('GU'),
                  leading: Radio<Locale>(
                    value: const Locale(AppStorageKey.gu, AppStorageKey.IN),
                    groupValue: languageController.localLanguage.value,
                    onChanged: (Locale? value) {
                      languageController.setLanguage(LanguageSetting.gu);
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
