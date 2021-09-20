import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:materials/src/routes/app_pages.dart';
import 'package:materials/src/services/firebase_serv.dart';

import 'package:materials/src/services/translation_serv.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);
var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.log('starting services ...');

  await GetStorage.init();
  await Get.putAsync(() => TranslationServ().init());
  await Get.putAsync(() => FirebaseServ().init());

  Get.log('All services started...');
  runApp(GetMaterialApp(
    title: TranslateHelper.appName,
    localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
    supportedLocales: Get.find<TranslationServ>().supportedLocales(),
    translationsKeys: Get.find<TranslationServ>().translations,
    fallbackLocale: Get.find<TranslationServ>().fallbackLocale,
    //  locale: Locale('ru'),
    locale: Get.find<TranslationServ>().fromStringToLocale(Platform.localeName),

    theme: ThemeData.dark(),
    initialRoute: AppPage.initial,
    getPages: AppPage.routes,
  ));
}
