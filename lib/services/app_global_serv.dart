import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppGlobalServ extends GetxService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static AppGlobalServ get to => Get.find();

  String idMaterial = '';
  String idClass = "";
  String idSubClass = '';

  String nameClass = '';
  String nameMaterial = '';
  String nameSubMaterial = '';
}
