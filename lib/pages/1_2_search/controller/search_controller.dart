// ignore_for_file: avoid_print, constant_identifier_names

import 'dart:developer';

import 'package:computer/computer.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:materials/pages/1_1_material_classes/controller/material_classes_controller.dart';

import 'package:materials/pages/1_1_material_classes/models/search_model.dart';
import 'package:materials/utils/logger.dart';

late MaterialClassesController c = MaterialClassesController.to;

class SearchController extends GetxController {
  static SearchController get to => Get.find();
  var listFilteredData = <SearchModel>[].obs;
  RxString findText = ''.obs;
  var isLoading = false.obs;
  final _listDataForSearch = <SearchModel>[].obs;

  // Future<List<SearchModel>> getFutureFilteredData(String textSearch) {
  //   if (textSearch.split(' ').length == 1) {
  //     if (textSearch.isEmpty || listSearchData.isEmpty) {
  //       listFilteredData.clear();
  //     } else {
  //       searchLogicRun(textSearch);
  //     }
  //   }

  //   if (textSearch.split(' ').length == 2) {
  //     textSearch = textSearch.split(' ')[1];
  //     if (textSearch != "") {
  //       listFilteredData.clear();

  //       for (int i = 0; i < listOldFilteredData.length; i++) {
  //         if (listOldFilteredData[i]
  //                 .nameMaterial
  //                 .toLowerCase()
  //                 .contains(textSearch.toLowerCase()) ||
  //             listOldFilteredData[i]
  //                 .nameSubClass
  //                 .toLowerCase()
  //                 .contains(textSearch.toLowerCase())) {
  //           listFilteredData.add(listOldFilteredData[i]);
  //           // sum filtered data
  //           searchSum.value = listFilteredData.length;
  //         }
  //       }
  //     }
  //   }
  //   return Future(() => listFilteredData);
  // }

  @override
  void onInit() {
    _listDataForSearch.value = c.listDataForSearch;
    super.onInit();
  }

  Future<void> searchLogicRun() async {
    var text = findText.split(' ');

    if (findText.split(' ').length == 1) {
      if (findText.isEmpty || _listDataForSearch.isEmpty) {
        listFilteredData.clear();
      } else {
        listFilteredData.value =
            await _firstSearch(findText.value, _listDataForSearch);
      }
    }
    if ((findText.split(' ').length == 2)) {
      findText.value = findText.split(' ')[1];
      if (findText.value != "") {
        listFilteredData.value =
            await _firstSearch(findText.value, listFilteredData);
      }
    }
    if ((findText.split(' ').length == 3)) {
      findText.value = findText.split(' ')[2];
      if (findText.value != "") {
        listFilteredData.value =
            await _firstSearch(findText.value, listFilteredData);
      }
    }
  }

  Future<List<SearchModel>> _firstSearch(
      String findText, List<SearchModel> listData) async {
    var data = listData;
    var listToPub = <SearchModel>[];
    String textSearch = findText;
    if (data.isNotEmpty && textSearch.isNotEmpty) {
      // listFilteredData.clear();

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
}
