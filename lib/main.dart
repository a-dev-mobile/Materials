
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/home_page.dart';

import 'package:materials/pages/test_page.dart';

import 'routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseFirestore.instance;
  runApp(
    GetMaterialApp(
      getPages: AppPages.pages,
      initialRoute: Routes.INITIAL,
      home: HomePage(),
    ),
  );
}
