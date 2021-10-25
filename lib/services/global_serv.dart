import 'package:get/get.dart';

import 'package:firebase_remote_config/firebase_remote_config.dart';

class GlobalServ extends GetxService {
  static GlobalServ get to => Get.find();

  int idMaterial = 0;
  int idClass = 0;
  int idSubClass = 0;

  String nameClass = '';
  String nameMaterial = '';
  String nameSubMaterial = '';
}
