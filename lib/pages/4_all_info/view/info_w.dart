import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/4_all_info/controller/info_c.dart';
import 'package:materials/pages/4_all_info/models/info_m.dart';
import 'package:materials/routes/app_page.dart';
import 'package:materials/services/app_global_serv.dart';
import 'package:materials/services/app_remote_serv.dart';
import 'package:materials/translations/translate_helper.dart';
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
               TranslateHelper.info,
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
         
        ]));
  }

  void _addInfoGlobalVar(InfoModel model) {
   
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
