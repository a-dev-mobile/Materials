import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/utils/app_const.dart';
import 'package:materials/utils/local_torage.dart';
import 'package:materials/utils/logger.dart';

class AppGlobalServ extends GetxService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static AppGlobalServ get to => Get.find();

  var isFirstStartApp = false;

  String idMaterial = '';
  String idClass = "";
  String idSubClass = '';

  String nameClass = '';
  String nameMaterial = '';
  String nameSubClass = '';

  Future<AppGlobalServ> init() async {
    logger.d('onInit global service');

    bool isNullFirstStartApp =
        await LocalStorage().isNull(AppConstString.keyIsFirstStartApp);

    // если первый запуск
    if (isNullFirstStartApp) {
      isFirstStartApp = true;
    } else {
      // устанавливаем если не первый запуск
      isFirstStartApp = false;
    }

    return this;
  }
}
