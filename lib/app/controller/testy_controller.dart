// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:materials/app/controller/base_controller.dart';
import 'package:materials/app/data/services/base_client.dart';
import 'package:materials/const.dart';

class TestController with BaseController {
  Future<void> getData() async {
    showLoading();

    var response = await BaseClient()
        .get(ConstUrlDB.baseUrl, ConstUrlDB.material)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    
    print(response);
  }
}
