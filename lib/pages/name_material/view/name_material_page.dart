import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:materials/pages/home_class_material/controller/home_class_material_controller.dart';
import 'package:materials/pages/name_material/controller/name_material_controller.dart';
import 'package:materials/pages/name_material/models/name_material_model.dart';

import 'package:materials/services/remote_controller.dart';

import 'package:materials/routes/app_page.dart';
import 'package:materials/services/global_serv.dart';
import 'package:materials/utils/logger.dart';

late NameMaterialController c = NameMaterialController.to;
late GlobalServ s = GlobalServ.to;

class NameMaterialPage extends StatelessWidget {
  const NameMaterialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int idGrade = 0;
    return Scaffold(
      appBar: AppBar(title: Text(s.nameClass)),
      body: Column(
        children: [
          Text('Search'),
          StreamBuilder(
              stream: c.getNameMaterialModelStream(),
              builder: (context, snapshot) {
                final tilesList = <ListTile>[];

                if (snapshot.hasData) {
                  final nameMaterialModelList =
                      snapshot.data as List<NameMaterialModel>;
                           
                  tilesList.addAll(nameMaterialModelList.map((nextItem) {
                    return ListTile(
                      leading: const Icon(Icons.access_alarm),
                      title: Text(nextItem.nameMaterial),
                      subtitle: Text(nextItem.subClass),
                      onTap: () {
                        
                        s.idNameMaterial = nextItem.idNameMaterial;
                        s.nameMaterial = nextItem.nameMaterial;
                        s.nameSubMaterial = nextItem.subClass;

                        Get.toNamed(Routes.materialInfo);
                        print(' id nameMaterial = ${s.idNameMaterial}');
                        // Get.toNamed(Routes.nameMaterial);
                      },
                    );
                  }));
                } else {
                  return const CircularProgressIndicator();
                }
                return Expanded(
                    child: ListView(
                  children: tilesList,
                ));
              }),
          /*  Obx(() => Expanded(
              child: ListView.builder(
                  itemCount: c.nameMaterialModelList.length,
                  itemBuilder: (BuildContext context, int index) {
                    // print({'URLLLL    ${c.getUrl('1.webp')}'});
                    return ListTile(
                      onTap: () {
                        idGrade = c.nameMaterialModelList[index].idGrade;
                        s.idGrade = idGrade;

                        print(' id = $idGrade');
                      },
                      leading: const Icon(Icons.access_alarm),
                      // leading: buildImage(index, w, h),
                      title: Text(c.nameMaterialModelList[index].grade),
                      subtitle: Text(c.nameMaterialModelList[index].subClass),
                    );
                  }))) */
        ],
      ),
    );
  }
}
