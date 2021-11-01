import 'package:get/get.dart';


class AppGlobalServ extends GetxService {
  static AppGlobalServ get to => Get.find();

  String idMaterial = '';
  String idClass = "";
  String idSubClass = '';

  String nameClass = '';
  String nameMaterial = '';
  String nameSubMaterial = '';
}
