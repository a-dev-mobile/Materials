// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:materials/pages/home_class_material/models/home_class_material_model.dart';
import 'package:materials/pages/name_material/models/name_material_model.dart';
import 'package:materials/services/global_serv.dart';
import 'package:materials/utils/logger.dart';

late GlobalServ s = GlobalServ.to;

class NameMaterialController extends GetxController {
  static NameMaterialController get to => Get.find();
  static const GRADE_SUBCLASS_PATH = 'database/nameSubClass';

  final _nameMaterialModelList = <NameMaterialModel>[].obs;

  RxList<NameMaterialModel> get nameMaterialModelList => _nameMaterialModelList;
  final _database = FirebaseDatabase.instance.reference();

  @override
  void onInit() {
    log.w("onInit");
    super.onInit();
  }

  void _performSingleFetch() {
    log.i("$GRADE_SUBCLASS_PATH/${s.idClass}/");

    _database
        .child("$GRADE_SUBCLASS_PATH/${s.idClass}/")
        .get()
        .then((snapshot) {
      final allData = Map<String, dynamic>.from(snapshot.value);
      _nameMaterialModelList.value = allData.values
          .map((jsonData) =>
              NameMaterialModel.fromRTDB(Map<String, dynamic>.from(jsonData)))
          .toList();
    });
  }

  Stream<List<NameMaterialModel>> getNameMaterialModelStream() {
    final nameMaterialModelStream =
        _database.child("$GRADE_SUBCLASS_PATH/${s.idClass}/").onValue;
    final streamToPublish = nameMaterialModelStream.map((event) {
      final dataMap = Map<String, dynamic>.from(event.snapshot.value);
      final nameMaterialModelList = dataMap.entries.map((e) {
        return NameMaterialModel.fromRTDB(Map<String, dynamic>.from(e.value));
      }).toList();
      return nameMaterialModelList;
    });
    return streamToPublish;
  }

  @override
  void onClose() {
    log.w("onClose");
    super.onClose();
  }

  @override
  void onReady() {
    log.w("onReady");
    // _performSingleFetch();
    super.onReady();
  }
  // _reference.onValue.listen((event) {
  //     final allData = Map<String, dynamic>.from(event.snapshot.value);
  //     _nameMaterialModelList.value = allData.values
  //         .map((jsonData) =>
  //             NameMaterialModel.fromRTDB(Map<String, dynamic>.from(jsonData)))
  //         .toList();
  //   });
}
