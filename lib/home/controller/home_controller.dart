// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';


import 'package:get/get.dart';
import 'package:materials/home/models/sum_class.dart';


class HomeController extends GetxController {
  static HomeController get to => Get.find();

  static const SUM_CLASS_PATH = 'database/classesAndSums/';

  final _sumClass = <SumClass>[].obs;

  RxList<SumClass> get sumClasses => _sumClass;

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
              SumClass.fromRTDB(Map<String, dynamic>.from(sumClassAsJson)))
          .toList();
    });
  }

  @override
  void onClose() {
    _sumClassStream.cancel();
    super.onClose();
  }
}
