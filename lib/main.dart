// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:materials/app/routes/app_pages.dart';
import 'package:materials/app/routes/app_routes.dart';


import 'app/ui/android/pages/category/category_page.dart';
import 'app/ui/android/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('main');
  await Hive.initFlutter();
// Hive.registerAdapter(CategoryTypeAdapter());
  // Hive.registerAdapter(CategoryNameAdapter());

  // DB db = DB();
  // if (await db.isOldLocal()) {
  // await db.updateLocalDB();
  // }

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.INITIAL,
    theme: appThemeData,
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
    home: CategoryPage(),
  ));
}
