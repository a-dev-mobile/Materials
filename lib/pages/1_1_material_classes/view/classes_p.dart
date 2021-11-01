import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:materials/pages/1_1_material_classes/controller/classes_c.dart';
import 'package:materials/pages/1_1_material_classes/models/classes_m.dart';
import 'package:materials/pages/1_2_search/controller/search_controller.dart';

import 'package:materials/services/app_remote_serv.dart';

import 'package:materials/routes/app_page.dart';
import 'package:materials/services/app_global_serv.dart';
import 'package:materials/utils/logger.dart';

late ClassesController c = ClassesController.to;
late SearchController cSearch = SearchController.to;
late AppRemoteServ remote = AppRemoteServ.to;
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
                logger.i('help for user');
              },
              icon: const Icon(Icons.help_outline_outlined))
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
    return ListTile(
      leading: const Icon(Icons.search),
      onTap: () {
        Get.toNamed(Routes.search);
      },
      title: const Text(
        'Search',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
