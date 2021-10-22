// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:materials/pages/home_class_material/models/home_class_material_model.dart';
import 'package:materials/pages/name_material/models/name_material_model.dart';
import 'package:materials/services/global_serv.dart';
import 'package:materials/utils/logger.dart';

late GlobalServ s = GlobalServ.to;

class NameMaterialController extends GetxController {
  static NameMaterialController get to => Get.find();
  static const GRADE_SUBCLASS_PATH = 'database/nameSubClass';

  final _database = FirebaseDatabase.instance.reference();

  Stream<List<NameMaterialModel>> getNameMaterialModelStream() {
    final nameMaterialModelStream =
        _database.child("$GRADE_SUBCLASS_PATH/${s.idClass}/").onValue;
        
    final streamToPublish = nameMaterialModelStream.map((event) {
      final dataMap = Map<String, dynamic>.from(event.snapshot.value);
      final nameMaterialModelList = dataMap.entries.map((e) {
        return NameMaterialModel.fromRTDB(Map<String, dynamic>.from(e.value));
      }).toList();
      return nameMaterialModelList;
    });
    return streamToPublish;
  }
}
