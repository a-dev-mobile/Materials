// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslateHelper {
  // он предназначен для предотвращения создания экземпляра TranslateHelper
  TranslateHelper._();
  static updateLocale(Locale locale) {
    Get.updateLocale(locale);
  }

  static String get onGenerateTitle => 'onGenerateTitle'.tr;
  static String get app_title => 'app_title'.tr;
  static String get search_title => 'search_title'.tr;
  static String get select_material_group => 'select_material_group'.tr;
  static String get select_material => 'select_material'.tr;
  static String get select_material_grade => 'select_material_grade'.tr;
  static String get find => 'find'.tr;
  static String get material_group => 'material_group'.tr;
  static String get material => 'material'.tr;
  static String get grade => 'grade'.tr;
  static String get chem_composition => 'chem_composition'.tr;
  static String get info => 'info'.tr;
  


}
