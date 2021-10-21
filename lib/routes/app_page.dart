

import 'package:get/get.dart';

abstract class Routes {
  static const initial = welcome;
  static const welcome = '/welcome';
  static const selectShape = '/selectShape';

  static const calculateTrapezoid = '/calculateTrapezoid';

  static const setting = '/setting';
}

class AppPage {
  static final pages = [
    GetPage(
        name: Routes.welcome,
        page: () => const WelcomePage(),
        binding: BindingsBuilder(() {
          Get.put<SettingContrl>(SettingContrl());
        })),
    GetPage(
        name: Routes.selectShape,
        page: () => const SelectShapePage(),
        binding: BindingsBuilder(() {
          Get.put<SelectShapeController>(SelectShapeController(),
              permanent: true);
        })),
    GetPage(
        name: Routes.calculateTrapezoid,
        transition: Transition.leftToRight,
        page: () => const CalculateTrapezoidPage(),
        binding: BindingsBuilder(() {
          Get.put<TrapezoidController>(TrapezoidController(), permanent: true);
        })),
    GetPage(
        name: Routes.setting,
        page: () => SettingPage(),
        transition: Transition.leftToRight,
        binding: BindingsBuilder(() {
          Get.put<SettingContrl>(SettingContrl());
        })),
  ];
}
