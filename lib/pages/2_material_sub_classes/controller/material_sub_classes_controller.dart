// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:materials/pages/2_material_sub_classes/models/material_sub_classes_model.dart';
import 'package:materials/services/global_serv.dart';
import 'package:materials/utils/logger.dart';

late GlobalServ s = GlobalServ.to;

class MaterialSubClassesController extends GetxController {
  static MaterialSubClassesController get to => Get.find();

  static const GRADE_SUBCLASS_PATH = 'data_base/material_sub_classes';

  final _database = FirebaseDatabase.instance.reference();

  Stream<List<MaterialSubClassesModel>> getNameMaterialModelStream() {
    final nameMaterialModelStream =
        _database.child("$GRADE_SUBCLASS_PATH/${s.idClass}/").onValue;

    final streamToPublish = nameMaterialModelStream.map((event) {
      final dataMap = Map<String, dynamic>.from(event.snapshot.value);
      final nameMaterialModelList = dataMap.entries.map((e) {
        return MaterialSubClassesModel.fromJson(
            Map<String, dynamic>.from(e.value));
      }).toList();
      return nameMaterialModelList;
    });
    return streamToPublish;
  }
}
