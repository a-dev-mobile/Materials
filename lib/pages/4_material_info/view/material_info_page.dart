import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:materials/pages/4_material_info/controller/material_info_controller.dart';
import 'package:materials/pages/4_material_info/models/material_info_model.dart';

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
    Size size = MediaQuery.of(context).size;
    int idGrade = 0;
    MaterialInfoModel model;

    return Scaffold(
      appBar: AppBar(title: Text(s.nameClass)),
      body: Column(
        children: [
          Text('Search'),
          FutureBuilder(
            // get futture data
            future: c.getFutureData(),
            builder:
                (BuildContext context, AsyncSnapshot<DataSnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                model = c.getModel(snapshot);
                return Column(children: [
Text(model.nameMaterial),
Text(model.nameClass),
Text(model.nameSubClass),
Text(model.nameOtherMaterial),
Text(model.addInfo),
Text(model.replaceMaterial),
Text(model.use),



                ]);
              } else {
                return const LinearProgressIndicator();
              }
            },
          )
        ],
      ),
    );
  }
}
