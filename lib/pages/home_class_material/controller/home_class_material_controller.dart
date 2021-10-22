// ignore_for_file: constant_identifier_names

import 'dart:async';


import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:materials/pages/home_class_material/models/home_class_material_model.dart';


class HomeClassMaterialController extends GetxController {
  static HomeClassMaterialController get to => Get.find();
  static const SUM_CLASS_PATH = 'database/classesAndSums/';


  final _database = FirebaseDatabase.instance.reference();





  Stream<List<HomeClassMaterialModel>> getNameMaterialModelStream() {
    final homeClassMaterialStream =
        _database.child(SUM_CLASS_PATH).onValue;
    final streamToPublish = homeClassMaterialStream.map((event) {
      final dataMap = Map<String, dynamic>.from(event.snapshot.value);
      final modelList = dataMap.entries.map((e) {
        return HomeClassMaterialModel.fromRTDB(Map<String, dynamic>.from(e.value));
      }).toList();
      return modelList;
    });
    return streamToPublish;
  }


}
