import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:materials/pages/1_1_classes/controller/classes_c.dart';
import 'package:materials/pages/1_1_classes/models/classes_m.dart';

import 'package:materials/pages/1_2_search/controller/search_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:materials/services/app_remote_serv.dart';

import 'package:materials/routes/app_page.dart';
import 'package:materials/services/app_global_serv.dart';
import 'package:materials/utils/app_const.dart';
import 'package:materials/utils/app_widget.dart';
import 'package:materials/utils/logger.dart';

late ClassesController c = ClassesController.to;

late SearchController cSearch = SearchController.to;

late AppGlobalServ s = AppGlobalServ.to;

class ClassesPage extends StatelessWidget {
  const ClassesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MaterialClassesModel> modelList;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
        actions: [
          IconButton(
              onPressed: () {
                Get.defaultDialog(
                  title: 'Что за цифры?',
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                        'Это сумма материалов и марок материала в данной группе'),
                  ),
                );
              },
              icon: const Icon(Icons.info_outline))
        ],
      ),
      body: Column(
        children: [
          //! future for search
          FutureBuilder(
              future: c.getFutureSearchData(),
              builder:
                  (BuildContext context, AsyncSnapshot<DataSnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  c.listDataForSearch = c.getSearchModelList(snapshot);
                  return buildSearch();
                } else {
                  return const LinearProgressIndicator();
                }
              }),
          AppWidget.title(
            title: AppLocalizations.of(context)!.select_material_group,
          ),
          //! future for name class
          FutureBuilder(
            // get futture data
            future: c.getFutureNameClass(),
            builder:
                (BuildContext context, AsyncSnapshot<DataSnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                modelList = c.getNameClassModelList(snapshot);
                return Expanded(
                  child: ListView.builder(
                    itemCount: modelList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(modelList[index].nameClass),
                        trailing: Text(
                            '${modelList[index].numberUniqSubClass} | ${modelList[index].numberUniqMaterials}'),
                        onTap: () {
                          s.idClass = modelList[index].idClass;
                          s.nameClass = modelList[index].nameClass;

                          Get.toNamed(Routes.subClasses);
                        },
                      );
                    },
                  ),
                );
              } else {
                return const LinearProgressIndicator();
              }
            },
          )
        ],
      ),
    );
  }

  Widget buildSearch() {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppConstColor.neutral_grey_800, width: 1)),
      child: ListTile(
        leading: const Icon(Icons.search),
        onTap: () {
          Get.toNamed(Routes.search);
        },
        title: Text(
          AppLocalizations.of(AppGlobalServ.navigatorKey.currentContext!)!
              .search_title,
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
