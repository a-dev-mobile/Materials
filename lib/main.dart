

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:logger/logger.dart';


import 'package:materials/services/global_serv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'routes/app_page.dart';

Future<void> main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await firebase_core.Firebase.initializeApp();

  // Logger.level = Level.nothing; //TODO on LOG




  Get.putAsync<GlobalServ>(() async => GlobalServ());

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
       initialRoute: Routes.materialClasses,
      defaultTransition: Transition.rightToLeft,
      getPages: AppPage.pages,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

