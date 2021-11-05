// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/3_names/models/names_m.dart';

import 'package:materials/services/app_global_serv.dart';

late AppGlobalServ s = AppGlobalServ.to;

class NamesController extends GetxController {
  static NamesController get to => Get.find();
      

}
