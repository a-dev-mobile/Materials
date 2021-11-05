
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/2_sub_classes/controller/sub_classes_c.dart';
import 'package:materials/pages/2_sub_classes/models/sub_classes_m.dart';

import 'package:materials/routes/app_page.dart';
import 'package:materials/services/app_global_serv.dart';
import 'package:materials/translations/translate_helper.dart';
import 'package:materials/utils/app_widget.dart';

late SubClassesController c = SubClassesController.to;
late AppGlobalServ s = AppGlobalServ.to;

class SubClassesPage extends StatelessWidget {
  const SubClassesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<SubClassesModel> modelList;

    return Scaffold(
      appBar: AppBar(title: Text(s.nameClass)),
      body: Column(
        children: [
  AppWidget.title(
            title: TranslateHelper.select_material,
          ),
       
        ],
      ),
    );
  }
}
