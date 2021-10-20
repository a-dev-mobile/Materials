// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:materials/home/models/sum_class.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  static const SUM_CLASS_PATH = 'database/classesAndSums/';
  static const IMAGE_CLASS_MATERIAL_PATH = 'image/class/';

  final _sumClass = <SumClass>[].obs;

  RxList<SumClass> get sumClasses => _sumClass;

  late StreamSubscription<Event> _sumClassStream;

  final _db = FirebaseDatabase.instance.reference();

  @override
  void onInit() {
    _listenToSumClass();
    super.onInit();
  }

  Future<String> getUrl(String imageName) async {
    final Reference storageReference = firebase_storage.FirebaseStorage.instance
        .ref(IMAGE_CLASS_MATERIAL_PATH + imageName);
    String downloadURL = await storageReference.getDownloadURL();

    print('========= url $downloadURL');

    return downloadURL;
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
