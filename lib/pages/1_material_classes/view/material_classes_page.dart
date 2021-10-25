import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:materials/pages/1_material_classes/controller/material_classes_controller.dart';
import 'package:materials/pages/1_material_classes/models/material_classes_model.dart';

import 'package:materials/services/app_remote_serv.dart';

import 'package:materials/routes/app_page.dart';
import 'package:materials/services/app_global_serv.dart';
import 'package:materials/utils/logger.dart';

late MaterialClassesController c = MaterialClassesController.to;
late AppRemoteServ remote = AppRemoteServ.to;
late AppGlobalServ s = AppGlobalServ.to;

class MaterialClassesPage extends StatelessWidget {
  const MaterialClassesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MaterialClassesModel> modelList;

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.appTitle)),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text('Search '),
        
          Text(remote.author),
          Text(remote.welcome),
          Text(' is dark ${remote.isDark}'),
          FutureBuilder(
            // get futture data
            future: c.getFutureData(),
            builder:
                (BuildContext context, AsyncSnapshot<DataSnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                modelList = c.getModelList(snapshot);
                return Expanded(
                  child: ListView.builder(
                    itemCount: modelList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(modelList[index].nameClass),
                        subtitle: Text(
                            '${modelList[index].numberUniqSubClass} | ${modelList[index].numberUniqMaterials} | ${modelList[index].idClass}'),
                        onTap: () {
                          s.idClass = modelList[index].idClass;
                          s.nameClass = modelList[index].nameClass;

                          Get.toNamed(Routes.materialSubClasses);
                        },
                      );
                    },
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          )
        ],
      ),
    );
  }
}
