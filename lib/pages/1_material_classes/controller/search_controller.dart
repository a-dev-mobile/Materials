import 'dart:convert';

import 'package:get/get.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:materials/pages/1_material_classes/models/search_model.dart';
import 'package:materials/utils/logger.dart';

class SearchController extends GetxController {
  static SearchController get to => Get.find();


  var _listData = <SearchModel>[];
  var listFilteredData = <SearchModel>[].obs;

  void findText(String textSearch) {
    if (textSearch.isEmpty || _listData.isEmpty) {
      listFilteredData.clear();
    } else {
      List<SearchModel> tempList = [];
      for (int i = 0; i < _listData.length; i++) {
        if (_listData[i]
                .nameMaterial
                .toLowerCase()
                .contains(textSearch.toLowerCase()) ||
            _listData[i]
                .nameSubClass
                .toLowerCase()
                .contains(textSearch.toLowerCase())) {
          tempList.add(_listData[i]);
        }
      }

      listFilteredData.value = tempList;
    }
  }

  void _loadAsset() async {
    String responseBody = await rootBundle.loadString('assets/search.json');
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    _listData =
        parsed.map<SearchModel>((json) => SearchModel.fromJson(json)).toList();
    log.i(_listData[2].toString());
  }

  @override
  void onInit() {
    _loadAsset();
    super.onInit();
  }
}
