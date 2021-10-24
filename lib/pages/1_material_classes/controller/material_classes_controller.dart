// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:materials/pages/1_material_classes/models/material_classes_model.dart';
import 'package:materials/utils/logger.dart';

class MaterialClassesController extends GetxController {
  static MaterialClassesController get to => Get.find();
  static const SUM_CLASS_PATH = 'data_base/material_classes/';

  final _database = FirebaseDatabase.instance.reference();
  List<MaterialClassesModel> models = [];

  Stream<List<MaterialClassesModel>> getNameMaterialModelStream() {
    final dataStream = _database.child(SUM_CLASS_PATH).onValue;

    final streamToPublish = dataStream.map((event) {
      final dataMap = Map<String, dynamic>.from(event.snapshot.value);
      final modelList = dataMap.entries.map((e) {
        return MaterialClassesModel.fromRTDB(
            Map<String, dynamic>.from(e.value));
      }).toList();

      return modelList;
    });
    return streamToPublish;
  }

  @override
  Future<void> onInit() async {
    List<MaterialClassesModel> modelList = [];
    var snapshot = await _database.child(SUM_CLASS_PATH).once();
   

    // Map<String, dynamic> map = json.decode(snapshot.value[0]);
    // logger.w(map);
         logger.w(snapshot.value);
    MaterialClassesModel model =
        MaterialClassesModel.fromRTDB(Map<String, dynamic>.from(snapshot.value));
         logger.w(model.toString());
// for(var value in _data){
//     logger.w(value);

//       // modelList.add(MaterialClassesModel.fromJson(value));
//     }

    // logger.w(modelList.length);
    // Map<String, dynamic> map = json.decode(_data[1]);
    // logger.w(map);
// for(var value in _data){
//     logger.w(value);
//       modelList.add(MaterialClassesModel.fromJson(value));
//     }
//     logger.w(modelList.length);
    // logger.w(snapshot.value);
    // final dataMap = Map<String, dynamic>.from(snapshot.value);
    // List jsonResponse = json.decode(snapshot.value);
// Map<String, dynamic> myMap = Map<String, dynamic>.from(snapshot);
// for(var value in snapshot.value as List){
//     logger.w(value);
//       modelList.add(MaterialClassesModel.fromJson(value));
//     }
    // var output = jsonDecode(snapshot.toString());
    // logger.w(modelList.length);
    // logger.w(myMap);

    // // logger.w(snapshot.value);
    // // final dataMap = Map<String, dynamic>.from(snapshot.value);
    // // logger.w(dataMap);
    // // // final modelList = dataMap.entries.map((e) {
    // // //   return models.add(
    // // //       MaterialClassesModel.fromJson(Map<String, dynamic>.from(e.value)));
    // // // }).toList();

    // logger.w(models.length);

    super.onInit();
  }
}
