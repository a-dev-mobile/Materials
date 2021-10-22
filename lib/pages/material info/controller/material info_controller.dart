// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:materials/pages/home_class_material/models/home_class_material_model.dart';
import 'package:materials/pages/material%20info/models/material%20info_model.dart';
import 'package:materials/pages/name_material/models/name_material_model.dart';
import 'package:materials/services/global_serv.dart';
import 'package:materials/utils/logger.dart';

late GlobalServ s = GlobalServ.to;

class MaterialInfoController extends GetxController {
  static MaterialInfoController get to => Get.find();
  static const GRADE_SUBCLASS_PATH = 'database/nameAllInfo';

  final _database = FirebaseDatabase.instance.reference();

  Future<dynamic> getModelFuture() async {
    final futureDataSnapshot =
        _database.child("$GRADE_SUBCLASS_PATH/${s.idNameMaterial}/").get();

    return futureDataSnapshot;
  }

  MaterialInfoModel getStream() {
    MaterialInfoModel materialInfo;
    final nameMaterialModelStream = _database
        .child("$GRADE_SUBCLASS_PATH/${s.idNameMaterial}/")
        .onValue
        .listen((event) {
      materialInfo = MaterialInfoModel.fromRTDB(
          Map<String, dynamic>.from(event.snapshot.value));
    });

    return materialInfo;
  }
}
