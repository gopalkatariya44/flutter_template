import '../settings/controllers/language_controller.dart';
import '../settings/controllers/theme_controller.dart';

import '../../common_imports.dart';
import 'controllers/home_controller.dart';

class UserProvider extends GetConnect {
  Future<Response> getUser(int id) =>
      get("https://api.restful-api.dev/objects");
  createUser(data) => post("https://api.restful-api.dev/objects", data);
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final themeController = Get.put(ThemeController());
  final languageController = Get.put(LanguageController());
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("app_name".tr),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(AppPageRoute.settings);
              },
              icon: const Icon(Icons.person))
        ],
      ),
      body: const Column(children: []),
    );
  }
}
