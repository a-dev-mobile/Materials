import 'package:get/get.dart';
import 'package:materials/services/app_global_serv.dart';
import 'package:materials/utils/app_const.dart';
import 'package:materials/utils/local_torage.dart';

class WelcomeController extends GetxController {
  static WelcomeController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    saveLocalIfFirstStartApp();
    super.onClose();
  }

  void saveLocalIfFirstStartApp() {
    if (AppGlobalServ.to.isFirstStartApp) {
      if (!AppConstBool.isDebug) {
        LocalStorage().setItemBool(AppConstString.keyIsFirstStartApp, false);
      }
    }
  }
}
