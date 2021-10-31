import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:materials/pages/4_material_info/controller/material_info_controller.dart';
import 'package:materials/pages/4_material_info/models/material_info_model.dart';
import 'package:materials/pages/4_material_info/view/material_chem.dart';

import 'package:materials/services/app_remote_serv.dart';

import 'package:materials/routes/app_page.dart';
import 'package:materials/services/app_global_serv.dart';
import 'package:materials/utils/logger.dart';

late MaterialInfoController c = MaterialInfoController.to;
late AppGlobalServ s = AppGlobalServ.to;

class MaterialInfo extends StatelessWidget {
  const MaterialInfo({Key? key}) : super(key: key);
  static const titleItemsMaterialInfo = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int idGrade = 0;
    MaterialInfoModel model;
    Map<String, String> mapChem = {};
    return Scaffold(
        appBar: AppBar(title: Text(s.nameMaterial)),
        body:SingleChildScrollView(
          child: Column(children: [
                // Text('Search'),
                FutureBuilder(
                  // get futture data
                  future: c.getFutureDataInfo(),
                  builder:
                      (BuildContext context, AsyncSnapshot<DataSnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      model = c.getModelInfo(snapshot);
                      return Column(
                        
                        children: [
                          buildInfoWidget(
                              title: model.nameClass, subTitle: 'Класс'),
                          buildInfoWidget(
                              title: model.nameSubClass, subTitle: 'Тип'),
                          buildInfoWidget(
                              title: model.nameMaterial,
                              subTitle: 'Марка Материала'),
                          buildInfoWidget(
                              title: model.nameOtherMaterial,
                              subTitle: 'Другое обозначение марки материала'),
                          buildInfoWidget(
                              title: model.addInfo,
                              subTitle: 'Дополнительная информация'),
                          buildInfoWidget(
                              title: model.use, subTitle: 'Использование'),
                          buildInfoWidget(
                              title: model.replaceMaterial, subTitle: 'Замена'),
                        ],
                      );
                    } else {
                      return const LinearProgressIndicator();
                    }
                  },
                ),
              
                FutureBuilder(
                  future: c.getFutureDataChem(),
                  builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      mapChem = c.getMapChem(snapshot);
                        
                      return ListView.builder(
                        shrinkWrap:true,
                        itemCount: mapChem.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Text(mapChem.keys.elementAt(index)),
                            trailing: Text(mapChem.values.elementAt(index)),
                          );
                        },
                      );
                    } else {
                      return LinearProgressIndicator();
                    }
                  },
                ),
              
                // const Expanded(
                //   flex: 1,
                //   child: Placeholder()
                // ),
              ]
            
          ),
        ));
  }

  Widget buildInfoWidget({required String title, required String subTitle}) {
    Widget toPublish = ListTile(title: Text(title), subtitle: Text(subTitle));

    return toPublish;
  }

  List<Widget> buildChemWidget(Map<String, String> mapChem) {
    List<Widget> chem = <Widget>[];

    mapChem.forEach((k, v) {
      chem.add(Column(
        children: [Text(k), Text(v)],
      ));
    });

    return chem;
  }
}
