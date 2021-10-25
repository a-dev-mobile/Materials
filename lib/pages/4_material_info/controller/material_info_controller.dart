// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:materials/pages/4_material_info/models/material_info_model.dart';
import 'package:materials/services/global_serv.dart';
import 'package:materials/utils/logger.dart';

late GlobalServ s = GlobalServ.to;

class MaterialInfoController extends GetxController {
  static MaterialInfoController get to => Get.find();

  final _database = FirebaseDatabase.instance.reference();

  Future<DataSnapshot> getFutureData() {
    final String _pathDB = 'data_base/material_info/${s.idMaterial}/';
    var data = _database.child(_pathDB).once();

    return data;
  }

  MaterialInfoModel getModel(AsyncSnapshot<DataSnapshot> snapshot) {
    MaterialInfoModel model = MaterialInfoModel.fromJson(
        Map<String, dynamic>.from(snapshot.data!.value));

    return model;
  }
}
