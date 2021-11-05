// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:materials/pages/1_1_home/models/home_m.dart';
import 'package:materials/services/app_global_serv.dart';
import 'package:materials/utils/logger.dart';
import 'package:sqflite/sqflite.dart';

class HomeController extends GetxController {
  var isLoadData = false.obs;
  @override
  void onInit() {
    // Future.delayed(Duration(seconds: 5), () {
    // isLoadData.value = true;
    // _openDB();
    // isLoadData.value = false;
    // });
    super.onInit();
  }

  Future<List<HomeModel>> openDB() async {

await Future.delayed(Duration(seconds: 5), () {});


    var models = <HomeModel>[];
    log.i('HomeController open DB');
    final database = await openDatabase(AppGlobalServ.to.pathToDB);
    var list = await database
        .rawQuery('SELECT DISTINCT class  FROM info_chem_property');

    for (var value in list) {
      models.add(HomeModel.fromJson(Map<String, dynamic>.from(value)));
    }
    database.close();

    log.i(' database.close();');
    return models;
  }
}
