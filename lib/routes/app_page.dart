import 'package:get/get.dart';
import 'package:materials/pages/home/controller/home_controller.dart';
import 'package:materials/pages/home/controller/remote_controller.dart';
import 'package:materials/pages/home/view/home_page.dart';

abstract class Routes {
  static const home = '/home';
  static const gradeSubclass = '/gradeSubclass';
}

class AppPage {
  static final pages = [
    GetPage(
        name: Routes.home,
        page: () => const HomePage(),
        binding: BindingsBuilder(() {
          Get.put<HomeController>(HomeController());
          Get.put<RemoteConfigController>(RemoteConfigController());
         
        })),
  ];
}
