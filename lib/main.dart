import 'package:flutter_template/features/detail_page.dart';
import 'package:flutter_template/utils/app_theme_data.dart';

import 'common_imports.dart';
import 'features/home_page.dart';
import 'common/controllers/theme_controller.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Template',
        darkTheme: AppThemeData.dark,
        theme: AppThemeData.light,
        themeMode: themeController.themeMode.value,
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => HomePage()),
          GetPage(name: '/details', page: () => const DetailPage()),
        ],
      ),
    );
  }
}
