// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

import 'package:get/get.dart';
import 'package:materials/pages/class_sum/models/class_sums_model.dart';
import 'package:materials/services/global_serv.dart';

late GlobalServ s = GlobalServ.to;

class GradeSubClassController extends GetxController {
  static GradeSubClassController get to => Get.find();

  static const GRADE_SUBCLASS_PATH = 'database/nameSubClass';

  final _gradeSubClassList = <GradeSubClassModel>[].obs;

  RxList<GradeSubClassModel> get gradeSubClassList => _gradeSubClassList;

  late StreamSubscription<Event> _gradeSubClassStream;

  final _db = FirebaseDatabase.instance.reference();

  @override
  void onInit() {
    _listen();
    super.onInit();
  }

  void _listen() {
    _gradeSubClassStream =
        _db.child("$GRADE_SUBCLASS_PATH/${s.idClass}").onValue.listen((event) {
      final allData = Map<String, dynamic>.from(event.snapshot.value);
      _gradeSubClassList.value = allData.values
          .map((jsonData) => GradeSubClassModel.fromRTDB(
              Map<String, dynamic>.from(jsonData)))
          .toList();
    });
  }

  @override
  void onClose() {
    _gradeSubClassStream.cancel();
    super.onClose();
  }
}
