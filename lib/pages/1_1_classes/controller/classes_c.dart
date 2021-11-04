// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:materials/pages/1_1_classes/models/search_m.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:materials/services/app_global_serv.dart';
import 'package:materials/services/app_remote_serv.dart';
import 'package:materials/utils/app_const.dart';
import 'package:materials/utils/local_torage.dart';
import 'package:materials/utils/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class ClassesController extends GetxController {
  static ClassesController get to => Get.find();
  @override
  void onInit() {
   if (AppRemoteServ.to.isUpdateDB) {
      LocalStorage()
          .setItemInt(AppConstString.keyVersionDB, AppRemoteServ.to.versionDB);
    }
    super.onInit();
  }
}
