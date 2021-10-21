import 'package:get/get.dart';
import 'package:materials/pages/class_sum/controller/class_sums_controller.dart';
import 'package:materials/pages/class_sum/view/class_sums_page.dart';

abstract class Routes {
  static const classSum = '/classSum';
  static const gradeSubclass = '/gradeSubclass';
}

class AppPage {
  static final pages = [
    GetPage(
        name: Routes.classSum,
        page: () => const ClassSumsPage(),
        binding: BindingsBuilder(() {
          Get.put<ClassSumsController>(ClassSumsController());
        })),
    GetPage(
        name: Routes.gradeSubclass,
        page: () => const ClassSumsPage(),
        binding: BindingsBuilder(() {})),
  ];
}
