import 'package:get/get.dart';
import 'package:materials/pages/1_1_material_classes/controller/classes_c.dart';

import 'package:materials/pages/1_1_material_classes/view/classes_p.dart';
import 'package:materials/pages/1_2_search/controller/search_controller.dart';
import 'package:materials/pages/1_2_search/view/search_page.dart';
import 'package:materials/pages/1_3_add/controller/add_c.dart';
import 'package:materials/pages/1_3_add/view/add_p.dart';
import 'package:materials/pages/2_material_sub_classes/controller/material_sub_classes_controller.dart';
import 'package:materials/pages/2_material_sub_classes/view/material_sub_classes_page.dart';
import 'package:materials/pages/3_names/controller/names_c.dart';
import 'package:materials/pages/3_names/view/names_page.dart';
import 'package:materials/pages/4_all_info/controller/all_info_controller.dart';
import 'package:materials/pages/4_all_info/controller/chem_c.dart';
import 'package:materials/pages/4_all_info/controller/edit_c.dart';
import 'package:materials/pages/4_all_info/controller/info_controller.dart';
import 'package:materials/pages/4_all_info/view/all_info_p.dart';
import 'package:materials/pages/5_edit/view/edit_p.dart';


abstract class Routes {
  static const classes = '/classes';
  static const search = '/search';
  static const subClasses = '/subClasses';
  static const names = '/names';
  static const allInfo = '/allInfo';
  static const edit = '/edit';
  static const add = '/add';
}

class AppPage {
  static final pages = [
    GetPage(
        name: Routes.classes,
        page: () => const ClassesPage(),
        binding: BindingsBuilder(() {
          Get.put<ClassesController>(ClassesController());
        })),
    GetPage(
        name: Routes.search,
        page: () => const SearchPage(),
        transition: Transition.downToUp,
        binding: BindingsBuilder(() {
          Get.put<SearchController>(SearchController());
        })),
    GetPage(
        name: Routes.subClasses,
        page: () => const MaterialSubClassesPage(),
        binding: BindingsBuilder(() {
          Get.put<MaterialSubClassesController>(MaterialSubClassesController());
        })),
    GetPage(
        name: Routes.names,
        page: () => const NamesPage(),
        binding: BindingsBuilder(() {
          Get.put<NamesController>(NamesController());
        })),
    GetPage(
        name: Routes.allInfo,
        page: () => AllInfoPage(),
        binding: BindingsBuilder(() {
          Get.put<AllInfoController>(AllInfoController());
          Get.put<InfoController>(InfoController());
          Get.put<ChemController>(ChemController());
        })),
          GetPage(
        name: Routes.edit,
        page: () => const EditPage(),
        binding: BindingsBuilder(() {
          Get.put<EditController>(EditController());
        
        })),     GetPage(
        name: Routes.add,
        page: () => const AddPage(),
        binding: BindingsBuilder(() {
          Get.put<AddController>(AddController());
        
        })),
  ];
}
