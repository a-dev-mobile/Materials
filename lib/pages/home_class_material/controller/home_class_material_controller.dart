// ignore_for_file: constant_identifier_names

import 'dart:async';


import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:materials/pages/home_class_material/models/home_class_material_model.dart';


class HomeClassMaterialController extends GetxController {
  static HomeClassMaterialController get to => Get.find();
  static const SUM_CLASS_PATH = 'database/classesAndSums/';

  final _sumClass = <HomeClassMaterialModel>[].obs;

  RxList<HomeClassMaterialModel> get sumClasses => _sumClass;

  late StreamSubscription<Event> _sumClassStream;

  final _db = FirebaseDatabase.instance.reference();

  @override
  void onInit() {
    _listenToSumClass();
    super.onInit();
  }


  void _listenToSumClass() {
    _sumClassStream = _db.child(SUM_CLASS_PATH).onValue.listen((event) {
      final allSumClass = Map<String, dynamic>.from(event.snapshot.value);
      _sumClass.value = allSumClass.values
          .map((sumClassAsJson) =>
              HomeClassMaterialModel.fromRTDB(Map<String, dynamic>.from(sumClassAsJson)))
          .toList();
    });
  }

  @override
  void onClose() {
    _sumClassStream.cancel();
    super.onClose();
  }
}
