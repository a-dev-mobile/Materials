// ignore_for_file: avoid_print, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/1_1_classes/controller/classes_c.dart';
import 'package:materials/pages/1_1_classes/models/search_m.dart';

import 'package:materials/services/app_global_serv.dart';
import 'package:materials/services/app_remote_serv.dart';

late ClassesController c = ClassesController.to;


class SearchController extends GetxController {
  static SearchController get to => Get.find();
  var listFilteredData = <SearchModel>[].obs;
  String findText = '';
  final _listDataForSearch = <SearchModel>[].obs;

  @override
  void onInit() {
    //transfer data from another controller
    // _listDataForSearch.value = c.listDataForSearch;
    super.onInit();
  }

  Future<void> searchLogicRun() async {
    prepareText();
    if (findText.isEmpty) {
      listFilteredData.clear();
    } else {
      var text = findText.split(' ');
// Depending on the number of sample spaces
      switch (text.length) {
        case 1:
          listFilteredData.value =
              await _firstSearch(text[0], _listDataForSearch);
          break;
        case 2:
          listFilteredData.value =
              await _firstSearch(text[0], _listDataForSearch);
          listFilteredData.value =
              await _firstSearch(text[1], listFilteredData);
          break;
        case 3:
          listFilteredData.value =
              await _firstSearch(text[0], _listDataForSearch);
          listFilteredData.value =
              await _firstSearch(text[1], listFilteredData);

          listFilteredData.value =
              await _firstSearch(text[2], listFilteredData);

          break;
      }
    }
  }

  void prepareText() {
    for (var i = 0; i < 5; i++) {
      findText = findText.replaceAll("  ", " ");
      findText = findText.replaceAll(".", "");
    }
    findText = findText.replaceAll("?", "");
    findText = findText.replaceAll(",", "");

    findText = findText.trimLeft();
    findText = findText.trimRight();
  }

  Future<List<SearchModel>> _firstSearch(
      String findText, List<SearchModel> listData) async {
    var data = listData;
    var listToPub = <SearchModel>[];
    String textSearch = findText;
    if (data.isNotEmpty || textSearch.isNotEmpty) {
      for (int i = 0; i < data.length; i++) {
        if (data[i]
                .nameMaterial
                .toLowerCase()
                .contains(textSearch.toLowerCase()) ||
            data[i]
                .nameSubClass
                .toLowerCase()
                .contains(textSearch.toLowerCase())) {
          listToPub.add(data[i]);
        }
      }
    }

    return listToPub;
  }

  @override
  void onReady() {

    super.onReady();
  }

  
}
