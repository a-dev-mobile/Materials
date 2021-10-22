import 'package:get/get.dart';
import 'package:materials/pages/home_class_material/controller/home_class_material_controller.dart';

import 'package:materials/pages/home_class_material/view/home_class_material_page.dart';
import 'package:materials/pages/name_material/controller/name_material_controller.dart';
import 'package:materials/pages/name_material/view/name_material_page.dart';
import 'package:materials/services/remote_controller.dart';

abstract class Routes {
  static const homeClassMaterial = '/homeClassMaterial';
  static const nameMaterial = '/nameMaterial';
}

class AppPage {
  static final pages = [
    GetPage(
        name: Routes.homeClassMaterial,
        page: () => const HomeClassMaterialPage(),
        binding: BindingsBuilder(() {
          Get.put<HomeClassMaterialController>(HomeClassMaterialController());
        })),
    GetPage(
        name: Routes.nameMaterial,
        page: () => const NameMaterialPage(),
        binding: BindingsBuilder(() {
          Get.put<NameMaterialController>(NameMaterialController());
        })),
  ];
}
