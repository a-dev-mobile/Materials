// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:materials/app/data/services/db.dart';

import 'package:materials/app/routes/app_pages.dart';
import 'package:materials/app/routes/app_routes.dart';
import 'package:materials/app/ui/android/pages/home/home_page.dart';
import 'package:materials/app/ui/android/widgets/dialog_helper.dart';

import 'app/data/model/category_name.dart';
import 'app/data/model/category_type.dart';

import 'app/ui/android/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('main');
  await Hive.initFlutter();
  Hive.registerAdapter(CategoryTypeAdapter());
  Hive.registerAdapter(CategoryNameAdapter());



  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.INITIAL,
    theme: appThemeData,
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
    home: HomePage(),
  ));
}
