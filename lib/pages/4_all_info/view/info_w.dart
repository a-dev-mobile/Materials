import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/4_all_info/controller/info_controller.dart';
import 'package:materials/pages/4_all_info/models/info_m.dart';
import 'package:materials/routes/app_page.dart';
import 'package:materials/services/app_remote_serv.dart';
import 'package:materials/utils/app_const.dart';
import 'package:materials/utils/logger.dart';

late InfoController c = InfoController.to;
late AppRemoteServ sRemote = AppRemoteServ.to;
class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key}) : super(key: key);
  static const titleItemsMaterialInfo = [];
  @override
  Scaffold build(BuildContext context) {
    InfoModel model;

    Map<String, String> mapChem = {};


    return Scaffold(
      appBar: AppBar(title: Column(
          children: [
            Text(sGlob.nameMaterial),
            const Text(
              'Информация',
              style: AppConstTextStyle.label_extra_bold,
            )
          ],
        ),
      actions: [
            
             IconButton(
              onPressed: () {
                Get.toNamed(Routes.edit);
              },
              icon: Icon(Icons.edit),
            ),
          ],
      
      
      
      ),
        body: Column(children: [




      FutureBuilder(
        future: c.getFutureDataInfo(),
        builder: (BuildContext context, AsyncSnapshot<DataSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            model = c.getModelInfo(snapshot);
            return Column(
              children: [
                //=========================
                buildInfoWidget(title: model.nameClass, subTitle: 'Класс'),
                //=========================
                buildInfoWidget(title: model.nameSubClass, subTitle: 'Тип'),
                //=========================
                buildInfoWidget(
                    title: model.nameMaterial, subTitle: 'Марка'),
                //=========================
                if (model.nameOtherMaterial.isNotEmpty)
                  buildInfoWidget(
                      title: model.nameOtherMaterial,
                      subTitle: 'Другое обозначение марки материала'),
                //=========================
                if (model.addInfo.isNotEmpty)
                  buildInfoWidget(
                      title: model.addInfo,
                      subTitle: 'Дополнительная информация'),
                //=========================
                if (model.use.isNotEmpty)
                  buildInfoWidget(title: model.use, subTitle: 'Использование'),
                //=========================
                if (model.replaceMaterial.isNotEmpty)
                  buildInfoWidget(
                      title: model.replaceMaterial, subTitle: 'Замена'),
                //=========================
              ],
            );
          } else {
            return const LinearProgressIndicator();
          }
        },
      ),
    ]));
  }

  Widget buildInfoWidget({required String title, required String subTitle}) {
    Widget toPublish = ListTile(subtitle: Text(title), title: Text(subTitle));

    return toPublish;
  }
}
