// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/3_names/models/names_m.dart';

import 'package:materials/services/app_global_serv.dart';

late AppGlobalServ s = AppGlobalServ.to;

class NamesController extends GetxController {
  static NamesController get to => Get.find();
      


  final _database = FirebaseDatabase.instance.reference();

  Future<DataSnapshot> getFutureData() {
final String _pathDB = 'data_base/material_names/${s.idSubClass}/';
    var data = _database.child(_pathDB).once();

    return data;
  }

  List<NamesModel> getModelList(
      AsyncSnapshot<DataSnapshot> snapshot) {
    List<NamesModel> models = [];
    var listValues = [];
    // перебираю чтобы забрать значения буз ключей

    snapshot.data!.value.forEach((key, value) {
      listValues.add(value);
    });

    // for (var value in snapshot.data!.value) {
    for (var value in listValues) {
      models.add(
          NamesModel.fromJson(Map<String, dynamic>.from(value)));
    }

    return models;
  }
}