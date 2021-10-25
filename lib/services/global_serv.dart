import 'package:get/get.dart';

import 'package:firebase_remote_config/firebase_remote_config.dart';

class GlobalServ extends GetxService {
  static GlobalServ get to => Get.find();

  String idMaterial = '';
  String idClass = "";
  String idSubClass = '';

  String nameClass = '';
  String nameMaterial = '';
  String nameSubMaterial = '';
}
