import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:materials/src/routes/app_pages.dart';
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
  await Get.putAsync(() => TranslationServ().init());
 
  runApp(GetMaterialApp(
    title: 'test',
    localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
    supportedLocales: Get.find<TranslationServ>().supportedLocales(),
    translationsKeys: Get.find<TranslationServ>().translations,
    fallbackLocale: Get.find<TranslationServ>().fallbackLocale,
    //  locale: Locale('ru'),
    locale: Get.find<TranslationServ>().fromStringToLocale('ru_RU'),

    theme: ThemeData.dark(),
    initialRoute: AppPage.INITIAL,
    getPages: AppPage.routes,
  ));
}
