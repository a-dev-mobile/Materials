import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

import 'package:materials/services/app_global_serv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:materials/services/app_remote_serv.dart';
import 'package:materials/utils/app_const.dart';

import 'routes/app_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  // Logger.level = Level.nothing; //TODO on LOG

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppConstColor.neutral_white,
    ));
  });
}

initServices() async {
  print('starting services ...');
  await firebase_core.Firebase.initializeApp();

  await Get.putAsync(() => AppRemoteServ().init());
  await Get.putAsync(() => AppGlobalServ().init());

  print('All services started...');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: AppGlobalServ.navigatorKey,
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      initialRoute: AppGlobalServ.to.isFirstStartApp
          ? Routes.welcome
          : AppRemoteServ.to.isUpdateDB
              ? Routes.loadDB
              : Routes.classes,
      defaultTransition: Transition.noTransition,
      getPages: AppPage.pages,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      themeMode: AppRemoteServ.to.isDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppConstColor.neutral_white,
        /* light theme settings */
        appBarTheme: const AppBarTheme(
            backgroundColor: AppConstColor.neutral_white,
            centerTitle: true,
            elevation: 1,
            iconTheme: IconThemeData(color: AppConstColor.neutral_grey_400),
            titleTextStyle: AppConstTextStyle.H3),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
    );
  }
}
