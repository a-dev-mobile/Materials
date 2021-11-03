import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:materials/services/app_global_serv.dart';
import 'package:materials/utils/logger.dart';

late AppGlobalServ _sGlob = AppGlobalServ.to;

class EditController extends GetxController {
late final TextEditingController _controller;

  static EditController get to => Get.find();
  TextEditingController get textController => _controller;

  final CollectionReference _addMaterialRef =
      FirebaseFirestore.instance.collection('edit_material');
  Future<void> editMaterial({required String text}) async {
    _addMaterialRef
        .add({
          '1_edit': text,
          '2_name': _sGlob.nameMaterial,
          '3_date': DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now()),
          'id_class': _sGlob.idClass,
          'id_sub_class': _sGlob.idSubClass,
          'id_material': _sGlob.idMaterial,
          'class': _sGlob.nameClass,
          'sub_class': _sGlob.nameSubClass,
        })
        .then((value) => logger.w('edit material'))
        .catchError((error) => logger.e("Failed to edit : $error"));
  }

  @override
  void onInit() {
    _controller = TextEditingController();
    super.onInit();
  }}

  // @override
  // void onClose() {
  //   _controller.dispose();

  //   super.onClose();
  // }

