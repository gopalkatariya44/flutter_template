import 'common_imports.dart';
import 'constants/app_page_routes.dart';
import 'features/settings/controllers/language_controller.dart';
import 'features/settings/controllers/theme_controller.dart';

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
        title: 'app_name'.tr,
        darkTheme: AppThemeData.dark,
        theme: AppThemeData.light,
        themeMode: themeController.themeMode.value,
        initialRoute: AppPageRoute.initialRoute,
        getPages: AppGetPages.list,
        locale: languageController.localLanguage.value,
        translations: Languages(),
      ),
    );
  }
}
