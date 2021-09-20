import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'dart:convert' as convert;

abstract class TranslateHelper {
  static String get appName => 'appName'.tr;
  static String get setting => 'setting'.tr;
}

class TranslationServ extends GetxService {
  final translations = <String, Map<String, String>>{}.obs;
  // fallbackLocale saves the day when the locale gets in trouble
  final fallbackLocale = const Locale('en', 'US');

  // must add language codes here
  static final languages = [
    'en_US',
    'ru_RU',
  ];

  // initialize the translation service by loading the assets/locales folder
  // the assets/locales folder must contains file for each language that named
  // with the code of language concatenate with the country code
  // for example (en_US.json)
  Future<TranslationServ> init() async {
    for (var lang in languages) {
      // ignore: unnecessary_brace_in_string_interps
      var _file = await getJsonFile('assets/locales/${lang}.json');
      translations.putIfAbsent(lang, () => Map<String, String>.from(_file));
    }
    return this;
  }

  static Future<dynamic> getJsonFile(String path) async {
    return rootBundle.loadString(path).then(convert.jsonDecode);
  }

  // get list of supported local in the application
  List<Locale> supportedLocales() {
    return TranslationServ.languages.map((_locale) {
      return fromStringToLocale(_locale);
    }).toList();
  }

  // Convert string code to local object
  Locale fromStringToLocale(String _locale) {
    if (_locale.contains('_')) {
      // en_US
      return Locale(
          _locale.split('_').elementAt(0), _locale.split('_').elementAt(1));
    } else {
      // en
      return Locale(_locale);
    }
  }
}
