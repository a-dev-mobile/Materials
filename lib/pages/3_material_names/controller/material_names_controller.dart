// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/2_material_sub_classes/models/material_sub_classes_model.dart';
import 'package:materials/pages/3_material_names/models/material_names_model.dart';
import 'package:materials/services/global_serv.dart';
import 'package:materials/utils/logger.dart';

late GlobalServ s = GlobalServ.to;

class MaterialNamesController extends GetxController {
  static MaterialNamesController get to => Get.find();
      


  final _database = FirebaseDatabase.instance.reference();

  Future<DataSnapshot> getFutureData() {
final String _pathDB = 'data_base/material_names/${s.idSubClass}/';
    var data = _database.child(_pathDB).once();

    return data;
  }

  List<MaterialNamesModel> getModelList(
      AsyncSnapshot<DataSnapshot> snapshot) {
    List<MaterialNamesModel> models = [];
    var listValues = [];
    // перебираю чтобы забрать значения буз ключей

    snapshot.data!.value.forEach((key, value) {
      listValues.add(value);
    });

    // for (var value in snapshot.data!.value) {
    for (var value in listValues) {
      models.add(
          MaterialNamesModel.fromJson(Map<String, dynamic>.from(value)));
    }

    return models;
  }
}
