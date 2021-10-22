// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:materials/pages/home_class_material/models/home_class_material_model.dart';
import 'package:materials/pages/material%20info/models/material_info_model.dart';
import 'package:materials/pages/name_material/models/name_material_model.dart';
import 'package:materials/services/global_serv.dart';
import 'package:materials/utils/logger.dart';

late GlobalServ s = GlobalServ.to;

class MaterialInfoController extends GetxController {
  static MaterialInfoController get to => Get.find();
  static const _GRADE_SUBCLASS_PATH = '/database/nameAllInfo';
  final _database = FirebaseDatabase.instance.reference();

  var isLoadData = false.obs;
  var model = MaterialInfoModel().obs;

  late StreamSubscription<Event> _stream;

  void _listenMaterialInfo() {
    var path = '$_GRADE_SUBCLASS_PATH/${s.idNameMaterial}';
    _stream = _database.child(path).onValue.listen((event) {
      if (event.snapshot.value == null) {
        isLoadData.value = true;
      } else {
        isLoadData.value = false;
        model.value = MaterialInfoModel.fromJson(
            Map<String, dynamic>.from(event.snapshot.value));
      }
    });
  }

  @override
  void onInit() {
    _listenMaterialInfo();

    super.onInit();
  }

  @override
  void onClose() {
    _stream.cancel();
    super.onClose();
  }
}
