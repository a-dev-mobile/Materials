// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

import 'package:get/get.dart';
import 'package:materials/pages/grade_subclass/models/grade_sub_class_model.dart';

import 'package:materials/services/global_serv.dart';

late GlobalServ s = GlobalServ.to;

class GradeSubClassController extends GetxController {
  static GradeSubClassController get to => Get.find();

  static const GRADE_SUBCLASS_PATH = 'database/nameSubClass';

  final _gradeSubClassList = <GradeSubClassModel>[].obs;

  RxList<GradeSubClassModel> get gradeSubClassList => _gradeSubClassList;

  late StreamSubscription<Event> _gradeSubClassStream;

  late DatabaseReference _reference;
  @override
  void onInit() {
    FirebaseDatabase database;
    database = FirebaseDatabase.instance;


    _reference =
        database.reference().child("$GRADE_SUBCLASS_PATH/${s.idClass}/");

    _listen();
    print('start');
    super.onInit();
  }

  void _listen() {
    _gradeSubClassStream = _reference.onValue.listen((event) {
      final allData = Map<String, dynamic>.from(event.snapshot.value);
      _gradeSubClassList.value = allData.values
          .map((jsonData) =>
              GradeSubClassModel.fromRTDB(Map<String, dynamic>.from(jsonData)))
          .toList();
    });
  }

  @override
  void onClose() {
    print('closssss');
    // _gradeSubClassStream.cancel();
    // _gradeSubClassList.clear();

    // _reference.remove();
    super.onClose();
  }
}
