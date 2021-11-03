import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/4_all_info/controller/info_c.dart';
import 'package:materials/pages/4_all_info/models/info_m.dart';
import 'package:materials/routes/app_page.dart';
import 'package:materials/services/app_global_serv.dart';
import 'package:materials/services/app_remote_serv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:materials/utils/app_const.dart';
import 'package:materials/utils/logger.dart';

late InfoController _cInfo = InfoController.to;
late AppGlobalServ _sGlob = AppGlobalServ.to;

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key}) : super(key: key);
  static const titleItemsMaterialInfo = [];
  @override
  Scaffold build(BuildContext context) {
    InfoModel model;

    Map<String, String> mapChem = {};

    return Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Text(
                _sGlob.nameMaterial,
                style: AppConstTextStyle.H3,
              ),
              Text(
                AppLocalizations.of(context)!.info,
                style: AppConstTextStyle.label_regular,
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
            future: _cInfo.getFutureDataInfo(),
            builder:
                (BuildContext context, AsyncSnapshot<DataSnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                model = _cInfo.getModelInfo(snapshot);
                //add info to glob
                _addInfoGlobalVar(model);

                return Column(
                  children: [
                    //=========================
                    buildInfoWidget(
                        title: model.nameClass,
                        subTitle: AppLocalizations.of(context)!.material_group),
                    //=========================
                    buildInfoWidget(
                        title: model.nameSubClass,
                        subTitle: AppLocalizations.of(context)!.material),
                    //=========================
                    buildInfoWidget(
                        title: model.nameMaterial,
                        subTitle: AppLocalizations.of(context)!.grade),
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
                      buildInfoWidget(
                          title: model.use, subTitle: 'Использование'),
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

  void _addInfoGlobalVar(InfoModel model) {
    _sGlob.idSubClass = model.idSubClass;
    _sGlob.idClass = model.idClass;
    _sGlob.idMaterial = model.idMaterial;
    _sGlob.nameClass = model.nameClass;
    _sGlob.nameSubClass = model.nameSubClass;
    _sGlob.nameMaterial = model.nameMaterial;
  }

  Widget buildInfoWidget({required String title, required String subTitle}) {
    Widget toPublish = ListTile(subtitle: Text(title), title: Text(subTitle));

    return toPublish;
  }
}
