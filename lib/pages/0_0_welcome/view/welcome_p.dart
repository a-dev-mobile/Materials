import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:materials/pages/1_1_classes/models/classes_m.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:materials/routes/app_page.dart';
import 'package:materials/services/app_global_serv.dart';
import 'package:materials/utils/app_const.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MaterialClassesModel> modelList;

    return Scaffold(
        appBar: AppBar(
          title: Text('welcome'),
        ),
        body: Container(
          color: Colors.blueGrey,
          child: ElevatedButton(
              onPressed: () {
                Get.offAndToNamed(Routes.loadDB);
              },
              child: Text('to load DB')),
        ));
  }
}
