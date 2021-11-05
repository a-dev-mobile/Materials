import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/utils/app_const.dart';
import 'package:materials/utils/local_torage.dart';
import 'package:materials/utils/logger.dart';

class AppGlobalServ extends GetxService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static AppGlobalServ get to => Get.find();
  var pathToDB = '';
  var isFirstStartApp = false;

  String idMaterial = '';

  String nameClass = '';
  String nameMaterial = '';
  String nameSubClass = '';

  Future<AppGlobalServ> init() async {
    logger.d('onInit global service');
    // если первый запуск
    // устанавливаем если не первый запуск
    // if not key isfirst app
    bool ifNotKeyFirstApp =
        await LocalStorage().isNull(AppConstString.keyIsFirstStartApp);

    if (ifNotKeyFirstApp) {
      isFirstStartApp = true;
      LocalStorage().setItemBool(AppConstString.keyIsFirstStartApp, true);
    } else if (await LocalStorage()
        .getItemBool(AppConstString.keyIsFirstStartApp)) {
      isFirstStartApp = true;
    } else {
      isFirstStartApp = false;
    }

    return this;
  }

  @override
  Future<void> onInit() async {
    //write path to db
    pathToDB = await LocalStorage().getItemString(AppConstString.keyPathDB);
    super.onInit();
  }
}
