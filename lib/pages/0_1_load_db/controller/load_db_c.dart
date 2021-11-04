// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:materials/services/app_global_serv.dart';
import 'package:materials/services/app_remote_serv.dart';
import 'package:materials/utils/app_const.dart';
import 'package:materials/utils/local_torage.dart';
import 'package:materials/utils/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class LoadDBController extends GetxController {
  static LoadDBController get to => Get.find();
  var isLoadDB = false.obs;

  Future<void> downloadDB() async {
    final path = '/database_sql/${AppRemoteServ.to.versionDB}/cd_install.exe';
    log.i('start load');
    isLoadDB.value = true;

    Directory appDocDir = await getApplicationDocumentsDirectory();
    File downloadToFile = File('${appDocDir.path}/main.db');

    try {
      await firebase_storage.FirebaseStorage.instance
          .ref(path)
          .writeToFile(downloadToFile);
    } on firebase_core.FirebaseException catch (e) {
      e.code == 'canceled';
      log.w(e);
    }
    log.i('end load');
    isLoadDB.value = false;
  }

  @override
  void onInit() async {
    
    if (AppGlobalServ.to.isFirstStartApp) {
      LocalStorage().setItemBool(AppConstString.keyIsFirstStartApp, false);
    }

    log.i(' start init');
    // if (AppRemoteServ.to.isUpdateDB) {
    await downloadDB();
    // }
    log.i(' end init');
 if (AppRemoteServ.to.isUpdateDB) {
      LocalStorage()
          .setItemInt(AppConstString.keyVersionDB, AppRemoteServ.to.versionDB);
    }
    super.onInit();
  }
}
