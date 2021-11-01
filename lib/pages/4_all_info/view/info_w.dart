import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:materials/pages/4_all_info/controller/info_controller.dart';
import 'package:materials/pages/4_all_info/models/info_m.dart';




late InfoController c = InfoController.to;

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key}) : super(key: key);
  static const titleItemsMaterialInfo = [];
  @override
  Scaffold build(BuildContext context) {
    InfoModel model;

    Map<String, String> mapChem = {};
    return Scaffold(
        body: SingleChildScrollView(
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
                  buildInfoWidget(title: model.nameClass, subTitle: 'Класс'),
                  buildInfoWidget(title: model.nameSubClass, subTitle: 'Тип'),
                  buildInfoWidget(
                      title: model.nameMaterial, subTitle: 'Марка Материала'),
                  buildInfoWidget(
                      title: model.nameOtherMaterial,
                      subTitle: 'Другое обозначение марки материала'),
                  buildInfoWidget(
                      title: model.addInfo,
                      subTitle: 'Дополнительная информация'),
                  buildInfoWidget(title: model.use, subTitle: 'Использование'),
                  buildInfoWidget(
                      title: model.replaceMaterial, subTitle: 'Замена'),
                ],
              );
            } else {
              return const LinearProgressIndicator();
            }
          },
        ),

      

      ]),
    ));
  }

  Widget buildInfoWidget(
      {required String title, required String subTitle}) {
    Widget toPublish =
        ListTile(title: Text(title), subtitle: Text(subTitle));

    return toPublish;
  }

}
