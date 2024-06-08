import 'common_imports.dart';
import 'features/home_page.dart';
import 'features/settings/controllers/language_controller.dart';
import 'features/settings/controllers/theme_controller.dart';
import 'features/settings/pages/settings_page.dart';

void main() async {
  await GetStorage.init();
  await Languages.initTranslations();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    final languageController = Get.put(LanguageController());
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'app_name',
        darkTheme: AppThemeData.dark,
        theme: AppThemeData.light,
        themeMode: themeController.themeMode.value,
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => HomePage()),
          GetPage(name: '/settings', page: () => SettingsPage()),
        ],
        locale: languageController.localLanguage.value,
        translations: Languages(),
      ),
    );
  }
}
