import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/1_1_material_classes/controller/material_classes_controller.dart';

import 'package:materials/pages/1_1_material_classes/view/material_classes_page.dart';
import 'package:materials/pages/1_2_search/controller/search_controller.dart';
import 'package:materials/pages/1_2_search/view/search_page.dart';
import 'package:materials/pages/2_material_sub_classes/controller/material_sub_classes_controller.dart';
import 'package:materials/pages/2_material_sub_classes/view/material_sub_classes_page.dart';
import 'package:materials/pages/3_material_names/controller/material_names_controller.dart';
import 'package:materials/pages/3_material_names/view/material_names_page.dart';
import 'package:materials/pages/4_material_info/controller/material_info_controller.dart';
import 'package:materials/pages/4_material_info/view/material_all_info_page.dart';
import 'package:materials/pages/4_material_info/view/material_info.dart';

abstract class Routes {
  static const materialClasses = '/materialClasses';
  static const search = '/search';
  static const materialSubClasses = '/materialSubClasses';
  static const materialNames = '/materialNames';
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
      name: Routes.search,
      page: () => const SearchPage(),
      transition: Transition.downToUp,

       binding: BindingsBuilder(() {
        
          Get.put<SearchController>(SearchController());
        })),

    GetPage(
        name: Routes.materialSubClasses,
        page: () => const MaterialSubClassesPage(),
        binding: BindingsBuilder(() {
          Get.put<MaterialSubClassesController>(MaterialSubClassesController());
        })),
    GetPage(
        name: Routes.materialNames,
        page: () => const MaterialNamesPage(),
        binding: BindingsBuilder(() {
          Get.put<MaterialNamesController>(MaterialNamesController());
        })),
    GetPage(
        name: Routes.materialInfo,
        page: () => MaterialAllInfoPage(),
        binding: BindingsBuilder(() {
          Get.put<MaterialInfoController>(MaterialInfoController());
        })),
  ];
}
