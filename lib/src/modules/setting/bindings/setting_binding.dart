import 'package:get/get.dart';
import 'package:materials/src/modules/setting/controller/setting_controller.dart';
import 'package:materials/src/services/firebase_serv.dart';


class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());

  }
}
