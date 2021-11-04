// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';

abstract class AppConstString {
  static const String keyIsFirstStartApp = 'isFirstStartApp';
  static const String keyVersionDB = 'versionDB';
  static const String keyIsUpdateDB = 'isUpdateDB';
  static const String NO_DATA = 'n/a';
  static const String EMAIL = 'a.dev.mobile@gmail.com';

  static var PLAY_STORE_URL =
      'http://play.google.com/store/apps/details?id=a.dev.calc_triangle';
}

class AppConstColor {
  static const Color primary_800 = Color(0xFF2D5385);
  static const Color primary_500 = Color(0xFF2F80ED);
  static const Color neutral_white = Color(0xFFffffff);
  static const Color neutral_grey_800 = Color(0xFF323F4B);
  static const Color neutral_grey_400 = Color(0xFF7B8794);
  static const Color neutral_grey_100 = Color(0xFFE3E7EB);

}

class AppConstTextStyle {
  static const TextStyle H3 =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: AppConstColor.neutral_grey_800);
 static const TextStyle label_extra_bold =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: AppConstColor.neutral_grey_800);
 static const TextStyle label_regular =
      TextStyle(fontWeight: FontWeight.normal, fontSize: 12,color: AppConstColor.neutral_grey_400);



}
