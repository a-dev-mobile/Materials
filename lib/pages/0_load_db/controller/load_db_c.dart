// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:materials/services/app_global_serv.dart';
import 'package:materials/utils/app_const.dart';
import 'package:materials/utils/local_torage.dart';
import 'package:materials/utils/logger.dart';
import 'package:path_provider/path_provider.dart';

class LoadDBController extends GetxController {
  static const String _PATH_ASSETS_DB = 'assets/db/materials.db';
  static const String _NAME_FILE = 'materials.db';

  var isCopyDB = false.obs;

  @override
  Future<void> onInit() async {
    log.i('start copy db');
    isCopyDB.value = true;

    _copyDBToLocal();

    log.i('end copy db');
    isCopyDB.value = false;

    super.onInit();
  }

  Future<void> _copyDBToLocal() async {
    ByteData data = await rootBundle.load(_PATH_ASSETS_DB);
    String dir = (await getApplicationSupportDirectory()).path;

    String path = '$dir/$_NAME_FILE';

    _savePath(path);

    _writeToFile(data, path);

    log.v('$dir/$_NAME_FILE');
  }

  void _savePath(String path) {
    AppGlobalServ.to.pathToDB = path;
    LocalStorage().setItemString(AppConstString.keyPathDB, path);
  }

  Future<void> _writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }
}
