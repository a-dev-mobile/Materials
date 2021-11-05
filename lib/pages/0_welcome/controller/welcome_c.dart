// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:materials/services/app_global_serv.dart';
import 'package:materials/utils/app_const.dart';
import 'package:materials/utils/local_torage.dart';
import 'package:materials/utils/logger.dart';
import 'package:path_provider/path_provider.dart';

class WelcomeController extends GetxController {
  @override
  void onClose() {
    saveLocalIfFirstStartApp();
    super.onInit();
  }

  Future<void> saveLocalIfFirstStartApp() async {
    if (AppGlobalServ.to.isFirstStartApp || !AppConstBool.isDebug) {
      LocalStorage().setItemBool(AppConstString.keyIsFirstStartApp, false);
    }
  }
}
