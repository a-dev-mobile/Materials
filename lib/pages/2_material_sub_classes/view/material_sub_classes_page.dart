import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:materials/pages/2_material_sub_classes/controller/material_sub_classes_controller.dart';
import 'package:materials/pages/2_material_sub_classes/models/material_sub_classes_model.dart';

import 'package:materials/services/remote_controller.dart';

import 'package:materials/routes/app_page.dart';
import 'package:materials/services/global_serv.dart';
import 'package:materials/utils/logger.dart';

late MaterialSubClassesController c = MaterialSubClassesController.to;
late GlobalServ s = GlobalServ.to;

class MaterialSubClassesPage extends StatelessWidget {
  const MaterialSubClassesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int idGrade = 0;
    List<MaterialSubClassesModel> modelList;
    MaterialSubClassesModel model;
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
                modelList = c.getModelList(snapshot);
                return Expanded(
                  child: ListView.builder(
                    itemCount: modelList.length,
                    itemBuilder: (context, index) {
                      model = modelList[index];
                      return ListTile(
                        title: Text(model.nameSubClass),
                        subtitle: Text(
                            '${model.numberUniqMaterial}'),
                        onTap: () {
                          s.idClass = model.idClass;
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
          /*  Obx(() => Expanded(
              child: ListView.builder(
                  itemCount: c.nameMaterialModelList.length,
                  itemBuilder: (BuildContext context, int index) {
                    // print({'URLLLL    ${c.getUrl('1.webp')}'});
                    return ListTile(
                      onTap: () {
                        idGrade = c.nameMaterialModelList[index].idGrade;
                        s.idGrade = idGrade;

                        print(' id = $idGrade');
                      },
                      leading: const Icon(Icons.access_alarm),
                      // leading: buildImage(index, w, h),
                      title: Text(c.nameMaterialModelList[index].grade),
                      subtitle: Text(c.nameMaterialModelList[index].subClass),
                    );
                  }))) */
        ],
      ),
    );
  }
}
