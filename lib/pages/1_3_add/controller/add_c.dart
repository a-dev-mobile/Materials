import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/utils/logger.dart';

class AddController extends GetxController {
  static AddController get to => Get.find();
  late TextEditingController _controller;
  final CollectionReference _addMaterialRef =
      FirebaseFirestore.instance.collection('add_material');

  Future<void> addMaterialToBase({required String text}) async {
    _addMaterialRef
        .add({
          'text': text,
        
        })
        .then((value) => logger.w('add material'))
        .catchError((error) => logger.e("Failed to add : $error"));
  }

@override
  void onInit() {
   _controller = TextEditingController();
    super.onInit();
  }

}
