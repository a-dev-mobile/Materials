// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/2_material_sub_classes/models/material_sub_classes_model.dart';
import 'package:materials/services/global_serv.dart';
import 'package:materials/utils/logger.dart';

late GlobalServ s = GlobalServ.to;

class MaterialSubClassesController extends GetxController {
  static MaterialSubClassesController get to => Get.find();

 

  final _database = FirebaseDatabase.instance.reference();

  Future<DataSnapshot> getFutureData() {
     final String _pathDB = 'data_base/material_sub_classes/${s.idClass}/';
    var data = _database.child(_pathDB).once();
    logger.w(_pathDB);
    return data;
  }

  List<MaterialSubClassesModel> getModelList(
      AsyncSnapshot<DataSnapshot> snapshot) {
    List<MaterialSubClassesModel> models = [];
    var listValues = [];
    // перебираю чтобы забрать значения буз ключей
        logger.w(snapshot.data!.value);
    snapshot.data!.value.forEach((key, value) {
      listValues.add(value);
    });

    for (var value in listValues) {
      models.add(
          MaterialSubClassesModel.fromJson(Map<String, dynamic>.from(value)));
    }

    return models;
  }
}
