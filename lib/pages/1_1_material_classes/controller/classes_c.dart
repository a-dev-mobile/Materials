// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/1_1_material_classes/models/classes_m.dart';
import 'package:materials/pages/1_1_material_classes/models/search_m.dart';
import 'package:materials/services/app_remote_serv.dart';
import 'package:materials/utils/logger.dart';

class ClassesController extends GetxController {
  static ClassesController get to => Get.find();
  static const _MATERIAL_CLASS_PATH = 'data_base/material_classes/';
  static const _SEARCH_PATH = 'search_data/';

  var listDataForSearch = <SearchModel>[];

  Future<DataSnapshot> getFutureNameClass() {
    return FirebaseDatabase.instance
        .reference()
        .child(_MATERIAL_CLASS_PATH)
        .once();
  }

  Future<DataSnapshot> getFutureSearchData() {
    return FirebaseDatabase.instance.reference().child(_SEARCH_PATH).once();
  }

  List<SearchModel> getSearchModelList(AsyncSnapshot<DataSnapshot> snapshot) {
    List<SearchModel> models = [];
    var listValues = [];
    // перебираю чтобы забрать значения без ключей
    snapshot.data!.value.forEach((key, value) {
      listValues.add(value);
    });

    for (var value in listValues) {
      models.add(SearchModel.fromJson(Map<String, dynamic>.from(value)));
    }
    return models;
  }

  List<MaterialClassesModel> getNameClassModelList(
      AsyncSnapshot<DataSnapshot> snapshot) {
    List<MaterialClassesModel> models = [];
    var listValues = [];
    // перебираю чтобы забрать значения буз ключей
    snapshot.data!.value.forEach((key, value) {
      listValues.add(value);
    });
    for (var value in listValues) {
      models
          .add(MaterialClassesModel.fromJson(Map<String, dynamic>.from(value)));
    }
    return models;
  }

  @override
  void onInit() {

    super.onInit();
  }
}
