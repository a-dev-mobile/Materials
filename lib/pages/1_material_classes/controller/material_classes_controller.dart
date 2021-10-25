// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/1_material_classes/models/material_classes_model.dart';
import 'package:materials/utils/logger.dart';

class MaterialClassesController extends GetxController {
  static MaterialClassesController get to => Get.find();
  static const _MATERIAL_CLASS_PATH = 'data_base/material_classes/';

  final _database = FirebaseDatabase.instance.reference();

  Future<DataSnapshot> getFutureData() {
    return _database.child(_MATERIAL_CLASS_PATH).once();
  }

  List<MaterialClassesModel> getModelList(AsyncSnapshot<DataSnapshot> snapshot) {
    List<MaterialClassesModel> models = [];
    for (var value in snapshot.data!.value) {
      logger.w(value);
      models
          .add(MaterialClassesModel.fromJson(Map<String, dynamic>.from(value)));
    }
    return models;
  }

}
