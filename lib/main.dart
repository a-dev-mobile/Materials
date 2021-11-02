import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

import 'package:materials/services/app_global_serv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:materials/services/app_remote_serv.dart';

import 'routes/app_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebase_core.Firebase.initializeApp();

  // Logger.level = Level.nothing; //TODO on LOG

  Get.putAsync<AppGlobalServ>(() async => AppGlobalServ());
  Get.putAsync<AppRemoteServ>(() async => AppRemoteServ());

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
      navigatorKey: AppGlobalServ.navigatorKey,
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      initialRoute: Routes.classes,
      defaultTransition: Transition.noTransition,
      getPages: AppPage.pages,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      themeMode: AppRemoteServ.to.isDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
    );
  }
}
