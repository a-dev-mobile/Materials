import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/3_names/controller/names_c.dart';
import 'package:materials/pages/3_names/models/names_m.dart';
import 'package:materials/routes/app_page.dart';
import 'package:materials/services/app_global_serv.dart';
import 'package:materials/translations/translate_helper.dart';
import 'package:materials/utils/app_const.dart';
import 'package:materials/utils/app_widget.dart';

late NamesController c = NamesController.to;
late AppGlobalServ s = AppGlobalServ.to;

class NamesPage extends StatelessWidget {
  const NamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<NamesModel> modelList;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(s.nameClass, style: AppConstTextStyle.label_extra_bold,),
            Text(
              s.nameSubClass,overflow: TextOverflow.ellipsis,
                 softWrap: true,
              style: AppConstTextStyle.label_regular,
            )
          ],
        ),
      ),
      body: Column(
        children: [
            AppWidget.title(
            title: TranslateHelper.select_material_grade,
          ),
        
        ],
      ),
    );
  }
}
