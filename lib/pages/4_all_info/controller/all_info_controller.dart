// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:materials/services/app_global_serv.dart';
import 'package:materials/services/app_remote_serv.dart';

late AppGlobalServ sGlob = AppGlobalServ.to;
late AppRemoteServ sRemote = AppRemoteServ.to;

class AllInfoController extends GetxController {
  static AllInfoController get to => Get.find();

  final RxInt currentIndex = 0.obs;

  changeCurrentIndex(int index) {
    currentIndex(index);
  }

  @override
  void onReady() {
    if (sRemote.isChangeLog) {
      Get.defaultDialog(
          title: 'update db',
          content: Text('data'),
   
          onCancel: () {
            sRemote.isChangeLog = false;
          });
    }
    super.onReady();
  }
}
