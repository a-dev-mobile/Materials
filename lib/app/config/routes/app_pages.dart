import 'package:get/get.dart';
import 'package:materials/app/config/routes/app_routes.dart';
import 'package:materials/app/features/home/bindings/home_binding.dart';
import 'package:materials/app/features/home/view/screen/home_screen.dart';
import 'package:materials/app/features/setting/view/screen/setting_screen.dart';
import 'package:materials/app/features/setting/view/screen/setting_screen.dart';

/// contains all configuration pages
class AppPages {
  /// when the app is opened this page will be the first to be shown
  static const INITIAL = Routes.HOME;
  static final routes = [
    GetPage(
        name: Routes.HOME, page: () => HomeScreen(), binding: HomeBinding()),
    GetPage(
        name: Routes.SETTING,
        page: () => SettingScreen(),
        // binding: SettingBinding()
        
        ),
  ];
}
