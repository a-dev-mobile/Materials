import 'package:get/get.dart';
import 'package:materials/pages/class_sum/controller/class_sums_controller.dart';
import 'package:materials/pages/class_sum/view/class_sums_page.dart';
import 'package:materials/pages/grade_subclass/controller/grade_sub_class_controller.dart';
import 'package:materials/pages/grade_subclass/view/grade_sub_class_page.dart';

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
        page: () => const GradeSubClassPage(),
        binding: BindingsBuilder(() {
          Get.put<GradeSubClassController>(GradeSubClassController());
        })),
  ];
}
