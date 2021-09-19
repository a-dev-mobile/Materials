import 'package:get/get.dart';
import 'package:materials/src/features/home/view/screen/home_screen.dart';
import 'package:materials/src/features/setting/view/screen/setting_screen.dart';

part 'app_routes.dart';

/// contains all configuration pages
class AppPages {
  /// when the app is opened this page will be the first to be shown
  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.setting,
      page: () => SettingScreen(),
      binding: SettingBinding(),
    ),
  ];
}
