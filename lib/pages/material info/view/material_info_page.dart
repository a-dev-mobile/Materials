import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:materials/pages/home_class_material/controller/home_class_material_controller.dart';
import 'package:materials/pages/material%20info/controller/material_info_controller.dart';
import 'package:materials/pages/material%20info/models/material_info_model.dart';
import 'package:materials/pages/name_material/controller/name_material_controller.dart';
import 'package:materials/pages/name_material/models/name_material_model.dart';

import 'package:materials/services/remote_controller.dart';

import 'package:materials/routes/app_page.dart';
import 'package:materials/services/global_serv.dart';
import 'package:materials/utils/logger.dart';

late MaterialInfoController c = MaterialInfoController.to;
late GlobalServ s = GlobalServ.to;

class MaterialInfoPage extends StatelessWidget {
  const MaterialInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = c.model.value;
    Size size = MediaQuery.of(context).size;
    int idGrade = 0;
    return Scaffold(
      appBar: AppBar(
          title: Text(
        '${s.nameClass} \n> ${s.nameSubMaterial} \n> ${s.nameMaterial}',
        style: TextStyle(fontSize: 10),
      )),
      body:  Obx(() => Column(
        children: [
         Text('is load ${c.isLoadData}'),
          Text('nameClass ${model.nameClass}'),
          Text('nameSubClass ${model.nameSubClass}'),
          Text('nameMaterial ${model.nameMaterial}'),
          Text('otherNameMaterial ${model.otherNameMaterial}'),
          Text('use ${model.use}'),
          Text('addInfo ${model.addInfo}'),
        ],
      ),
     ) );
  }
}
