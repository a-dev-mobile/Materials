// ignore_for_file: avoid_print, constant_identifier_names

import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:logger/logger.dart';
import 'package:materials/pages/1_1_material_classes/controller/material_classes_controller.dart';

import 'package:materials/pages/1_1_material_classes/models/search_model.dart';
import 'package:materials/utils/logger.dart';

late MaterialClassesController c = MaterialClassesController.to;

class SearchController extends GetxController {
  static SearchController get to => Get.find();

  List<SearchModel> listSearchData = [];

  RxString findText = ''.obs;

  Future<List<SearchModel>> getFutureFilteredData(String textSearch) {
    var listFilteredData = <SearchModel>[];

    if (textSearch.isEmpty || listSearchData.isEmpty) {
      listFilteredData.clear();
    } else {
      for (int i = 0; i < listSearchData.length; i++) {
        if (listSearchData[i]
                .nameMaterial
                .toLowerCase()
                .contains(textSearch.toLowerCase()) ||
            listSearchData[i]
                .nameSubClass
                .toLowerCase()
                .contains(textSearch.toLowerCase())) {
          listFilteredData.add(listSearchData[i]);
        }
      }
    }
    return Future(() => listFilteredData);
  }

  @override
  void onInit() {
    //! init data for material name controller
    listSearchData = c.listSearchAllData;

    super.onInit();
  }
}
