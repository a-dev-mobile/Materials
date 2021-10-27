import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/1_1_material_classes/models/search_model.dart';

import 'package:materials/pages/1_2_search/controller/search_controller.dart';
import 'package:materials/utils/logger.dart';

SearchController c = SearchController.to;

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('search'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(c.listSearchData[10].toString()),
            Container(
              color: Colors.black12,
              width: Get.width,
              height: Get.height * 0.1,
              child: TextField(
                onChanged: (text) {
                  c.findText(text);
                },
              ),
            ),
            Obx(() {
              return FutureBuilder(
                  future: c.getFutureFilteredData(c.findText.value),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return buildWidgetFilteredData(
                          snapshot.data as List<SearchModel>);
                    } else {
                      return CircularProgressIndicator();
                    }
                  });
            })
          ],
        ),
      ),
    );
  }

  Widget buildWidgetFilteredData(List<SearchModel> list) {
    List<Widget> listWidget = [];
    for (var item in list) {
      listWidget.add(itemFindText(
          title: item.nameMaterial,
          subTitle: item.nameSubClass,
          idMaterial: item.idMaterial));
    }

    return Column(children: listWidget);
  }

  Widget itemFindText(
      {required String title,
      required String subTitle,
      required String idMaterial}) {
    return ListTile(
      title: Text(title),
      onTap: () {
        log.i(' id material  = $idMaterial');
      },
      subtitle: Text(subTitle),
    );
  }
}
