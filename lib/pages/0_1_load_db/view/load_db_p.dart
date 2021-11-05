import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/1_1_classes/models/classes_m.dart';



import 'package:materials/routes/app_page.dart';
import 'package:materials/services/app_global_serv.dart';
import 'package:materials/utils/app_const.dart';

class LoadDBPage extends StatelessWidget {
  const LoadDBPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MaterialClassesModel> modelList;

    return Scaffold(
        appBar: AppBar(
          title: Text('обновление DB'),
        ),
        body: Container(
          color: Colors.amber, 
        ));
  }

}
