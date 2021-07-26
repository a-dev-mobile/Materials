
import 'package:get/get.dart';
import 'package:materials/app/ui/android/pages/category/category_page.dart';
import 'package:materials/app/ui/android/pages/home/home_page.dart';



import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page:()=> HomePage(),),
    GetPage(name: Routes.CATEGORY, page:()=> CategoryPage(),transition: Transition.zoom),
  ];
}