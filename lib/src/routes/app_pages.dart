import 'package:get/get.dart';
import 'package:materials/src/modules/home/bindings/home_binding.dart';
import 'package:materials/src/modules/home/view/page/home_screen.dart';

import 'package:materials/src/routes/app_routes.dart';

class AppPage {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
  ];
}
