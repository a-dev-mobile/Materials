import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/1_material_classes/controller/search_controller.dart';
import 'package:materials/utils/logger.dart';

SearchController c = SearchController.to;

class MaterialSearchWidget extends StatelessWidget {
  const MaterialSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        Obx(() => SingleChildScrollView(
          child: Column(
                children: buildWidgetFilteredData(),
              ),
        ))
      ],
    );
  }

  List<Widget> buildWidgetFilteredData() {
    List<Widget> listWidget = [];
    for (var item in c.listFilteredData) {
      listWidget.add(itemFindText(
          title: item.nameMaterial,
          subTitle: '${item.nameClass} > ${item.nameSubClass}'));
    }
    return listWidget;
  }

  Widget itemFindText({required String title, required String subTitle}) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }
}
