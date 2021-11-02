import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/1_1_classes/controller/classes_c.dart';


import 'package:materials/pages/1_2_search/controller/search_controller.dart';
import 'package:materials/routes/app_page.dart';
import 'package:materials/services/app_global_serv.dart';
import 'package:materials/services/app_remote_serv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

late SearchController c = SearchController.to;
late AppGlobalServ sGlob = AppGlobalServ.to;
late ClassesController cClass = ClassesController.to;

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalizations.of(AppGlobalServ.navigatorKey.currentContext!)!
                .search_title),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(Routes.add);
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    autofocus: true,
                    onChanged: (inputText) {
                      c.findText = inputText;
                    },
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Get.defaultDialog(
                        title: 'Расширенный поиск',
                        middleText:
                            'Используйте пробел для поиска любого символа',
                        // content: Align(
                        //   alignment: Alignment.center,
                        //   child: Text(
                        //       'Используйте пробел для поиска любого символа'),
                        // ));
                      );
                    },
                    icon: const Icon(Icons.info_outline)),
                IconButton(
                  onPressed: () {
                    c.searchLogicRun();
                  },
                  icon: Icon(Icons.search),
                ),
              ],
            ),
          ),
          Obx(() => Text('Найдено = ${c.listFilteredData.length}')),
          Obx(() {
            return Expanded(
              child: ListView.builder(
                  itemCount: c.listFilteredData.length,
                  itemBuilder: (context, index) => itemFindText(
                        title: c.listFilteredData[index].nameMaterial,
                        subTitle: c.listFilteredData[index].nameSubClass,
                        idMaterial: c.listFilteredData[index].idMaterial,
                      )),
            );
          })
        ],
      ),
    );
  }

  Widget itemFindText(
      {required String title,
      required String subTitle,
      required String idMaterial}) {
    return ListTile(
      title: Text(title),
      onTap: () {
        sGlob.idMaterial = idMaterial;
        sGlob.nameMaterial = title;
        sGlob.nameSubMaterial = subTitle;
        Get.toNamed(Routes.allInfo);
      },
      subtitle: Text(subTitle),
    );
  }
}
