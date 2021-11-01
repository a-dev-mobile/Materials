// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/4_all_info/models/chem_m.dart';

import 'package:materials/services/app_global_serv.dart';
import 'package:materials/utils/logger.dart';

late AppGlobalServ sGlob = AppGlobalServ.to;

class ChemController extends GetxController {
  static ChemController get to => Get.find();
  var isReverse = false.obs;

  RxList<ChemModel> listModel = <ChemModel>[].obs;
  Map<String, String> _mapChem = {};
  Map<String, double> _mapChemSort = {};
  final _database = FirebaseDatabase.instance.reference();

  Future<DataSnapshot> getFutureDataChem() async {
    final String _pathDB = 'data_base/material_chem/${sGlob.idMaterial}/';
    var data = _database.child(_pathDB).once();

    return data;
  }



  Future<void> getfuture(bool isReverseData) async {
    //  isLoad.value = true;
  
    
    DataSnapshot snapshot = await getFutureDataChem();
    _mapChem = _getMapChem(snapshot);
    _mapChemSort =_parsingValueInDouble(isReverseData);
    listModel.value =getChemModel();

    

  }

  Map<String, String> _getMapChem(DataSnapshot snapshot) {
    Map<String, String> mapChem = {};
    snapshot.value.forEach((key, value) {
      mapChem[key] = value;
    });

    return mapChem;
  }

  List<ChemModel> getChemModel() {
    List<ChemModel> modelList = [];

    _mapChemSort.forEach((key, value) {
      modelList.add(ChemModel(
          abrv: key, name: 'Хром', percent: value, value: _mapChem[key]!));
    });

    return modelList;
  }

  Map<String, double> _parsingValueInDouble(bool isReverse) {
    Map<String, double> mapNotSort = {};
    Map<String, double> mapSort = {};
    Map<String, double> mapSortReverse = {};
    double vD1 = 0.0;
    double vD2 = 0.0;
    double vD = 0.0;
    List<String> vList = [];

    _mapChem.forEach((k, v) {
      //symbols that in base
      v = _removeNotNeededChar(v);
      if (v.contains('-')) {
        vList = v.split('-');
        if (vList.length == 2) {
          vD1 = double.tryParse(vList[0])!;
          vD2 = double.tryParse(vList[1])!;
          vD = (vD1 + vD2) / 2;
        }
      } else {
        vD = double.tryParse(v)!;
      }

      mapNotSort[k] = vD;
    });
// sort 1...10
    var mapEntries = mapNotSort.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));

    mapSort
      ..clear()
      ..addEntries(mapEntries);
// sort 10...1
    if (isReverse) {
      int size = mapSort.length;
      for (int i = 0; i < size; i++) {
        String x = mapSort.entries.last.key.toString();
        double y = mapSort.entries.last.value;
        mapSortReverse[x] = y;
        mapSort.remove(x);
      }
      return mapSortReverse;
    }

    return mapSort;
  }

  String _removeNotNeededChar(String v) {
    v = v.replaceAll('>', '');
    v = v.replaceAll('^', '');
    v = v.replaceAll('!', '');
    v = v.replaceAll('=', '');
    v = v.replaceAll('#', '');
    return v;
  }
}
