import 'package:flutter_template/constants/app_page_routes.dart';

import '../common_imports.dart';
import '../features/home/home_page.dart';
import '../features/settings/pages/settings_page.dart';

class AppGetPages {
  static List<GetPage<dynamic>> list = [
    GetPage(name: AppPageRoute.home, page: () => HomePage()),
    GetPage(name: AppPageRoute.settings, page: () => SettingsPage()),
  ];
}
