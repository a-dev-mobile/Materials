// ignore_for_file: avoid_print, constant_identifier_names

import 'dart:convert';

import 'package:computer/computer.dart';
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
  var listFilteredData = <SearchModel>[];
  var listOldFilteredData = <SearchModel>[];
  RxString findText = ''.obs;
  final computer = Computer();

  List<SearchModel> getfromcomputerData(String textSearch) {
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
          listOldFilteredData.add(listSearchData[i]);
        }
      }
    }
    return listFilteredData;
  }

  void startComputer(String textSearch) async {
    await computer.turnOn(
      workersCount: 1,
      verbose: true,
    );

    try {
      log.w('start computer');
      final a =
          await computer.compute<String, List<String>>(asyncFib, param: 'text');
      if (a.isEmpty) print('empty');
      if (a.isNotEmpty) print('NOTempty');
      for (var item in a) {
        log.w(item);
      }
    } catch (error) {
      print(error);
      print('Task a failed');
    }
  }

  static Future<List<String>> asyncFib(String n) async {
    // await Future<void>.delayed(const Duration(seconds: 2));
    List<String> listString = [];
    var i = 0;
    for (i = 0; i < 10000000; i++) {
      listString.add('$i = a = $n');
    }
    return listString;
  }

  Future<List<SearchModel>> getFutureFilteredData(String textSearch) {
    if (textSearch.split(' ').length == 1) {
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
            listOldFilteredData.add(listSearchData[i]);
          }
        }
      }
    }

    if (textSearch.split(' ').length == 2) {
      textSearch = textSearch.split(' ')[1];
      if (textSearch != "") {
        listFilteredData.clear();

        for (int i = 0; i < listOldFilteredData.length; i++) {
          if (listOldFilteredData[i]
                  .nameMaterial
                  .toLowerCase()
                  .contains(textSearch.toLowerCase()) ||
              listOldFilteredData[i]
                  .nameSubClass
                  .toLowerCase()
                  .contains(textSearch.toLowerCase())) {
            listFilteredData.add(listOldFilteredData[i]);
          }
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
