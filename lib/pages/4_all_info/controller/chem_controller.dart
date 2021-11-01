// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:materials/services/app_global_serv.dart';

late AppGlobalServ sGlob = AppGlobalServ.to;

class ChemController extends GetxController {
  static ChemController get to => Get.find();

  final _database = FirebaseDatabase.instance.reference();

  Future<DataSnapshot> getFutureDataChem() async {
    final String _pathDB = 'data_base/material_chem/${sGlob.idMaterial}/';
    var data = _database.child(_pathDB).once();
    return data;
  }

  Map<String, String> getMapChem(AsyncSnapshot<DataSnapshot> snapshot) {
    Map<String, String> mapChem = {};
    snapshot.data!.value.forEach((key, value) {
      mapChem[key] = value;
    });

    return mapChem;
  }
}
