import '../common/controllers/language_controller.dart';
import '/common/controllers/theme_controller.dart';

import '../common_imports.dart';

class UserProvider extends GetConnect {
  Future<Response> getUser(int id) =>
      get("https://api.restful-api.dev/objects");
  createUser(data) => post("https://api.restful-api.dev/objects", data);
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final themeController = Get.put(ThemeController());
  final languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title".tr),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed('/settings');
              },
              icon: const Icon(Icons.person))
        ],
      ),
      body: Column(),
    );
  }
}
