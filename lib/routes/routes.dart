// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:materials/pages/home_page.dart';
import 'package:materials/pages/sub_page.dart';

abstract class Routes {
  static const INITIAL = '/';
  static const SUB = '/sub';
  static const TEST = '/test';
}

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => HomePage(),
        transition: Transition.fade),
    GetPage(
            name: Routes.SUB,
      page: () => SubPage(),
      transition: Transition.zoom,
    ), 
       GetPage(
            name: Routes.SUB,
      page: () => SubPage(),
      transition: Transition.zoom,
    ),
  ];
}
