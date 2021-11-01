import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:materials/utils/logger.dart';

class AddController extends GetxController {
  static AddController get to => Get.find();
  CollectionReference _addMaterialRef =
      FirebaseFirestore.instance.collection('add_material');

  Future<void> addMaterialToBase({String name = '', String desc = ''}) async {
    _addMaterialRef
        .add({
          'name': name,
          'desc': desc,
        })
        .then((value) => logger.w('add material'))
        .catchError((error) => logger.e("Failed to add : $error"));
  }
}
