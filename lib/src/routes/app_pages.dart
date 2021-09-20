import 'package:get/get.dart';
import 'package:materials/src/modules/home/bindings/home_binding.dart';
import 'package:materials/src/modules/home/view/page/home_page.dart';
import 'package:materials/src/modules/setting/bindings/setting_binding.dart';
import 'package:materials/src/modules/setting/view/page/setting_page.dart';

import 'package:materials/src/routes/app_routes.dart';

class AppPage {
  static const initial = Routes.home;

  static final routes = [
    GetPage(name: Routes.home, page: () => const HomePage(), binding: HomeBinding()),
    GetPage(name: Routes.setting, page: () => const SettingPage(), binding: SettingBinding()),
  ];
}
