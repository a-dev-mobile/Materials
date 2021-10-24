import 'package:get/get.dart';
import 'package:materials/pages/1_material_classes/controller/material_classes_controller.dart';
import 'package:materials/pages/1_material_classes/view/material_classes_page.dart';
import 'package:materials/pages/2_material_sub_classes/controller/material_sub_classes_controller.dart';
import 'package:materials/pages/2_material_sub_classes/view/material_sub_classes_page.dart';


abstract class Routes {
  static const materialClasses = '/materialClasses';
  static const materialSubClasses = '/materialSubClasses';
  static const materialInfo = '/materialInfo';
}

class AppPage {
  static final pages = [
    GetPage(
        name: Routes.materialClasses,
        page: () => const MaterialClassesPage(),
        binding: BindingsBuilder(() {
          Get.put<MaterialClassesController>(MaterialClassesController());
        })),
    GetPage(
        name: Routes.materialSubClasses,
        page: () => const MaterialSubClassesPage(),
        binding: BindingsBuilder(() {
          Get.put<MaterialSubClassesController>(MaterialSubClassesController());
        })),
      
  ];
}
