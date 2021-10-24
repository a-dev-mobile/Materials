import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:materials/pages/1_material_classes/controller/material_classes_controller.dart';
import 'package:materials/pages/1_material_classes/models/material_classes_model.dart';

import 'package:materials/services/remote_controller.dart';

import 'package:materials/routes/app_page.dart';
import 'package:materials/services/global_serv.dart';
import 'package:materials/utils/logger.dart';

late MaterialClassesController c = MaterialClassesController.to;
late RemoteConfigController remote = RemoteConfigController.to;
late GlobalServ s = GlobalServ.to;

class MaterialClassesPage extends StatelessWidget {
  const MaterialClassesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int idClass = 0;
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.appTitle)),
      body: Column(
        children: [
          Text('Search'),
          StreamBuilder(
              stream: c.getNameMaterialModelStream(),
              builder: (context, snapshot) {
                final tilesList = <ListTile>[];
                logger.w(snapshot.data);
                if (snapshot.hasData) {
                logger.w(snapshot.data);
                  final nameMaterialModelList =
                      snapshot.data as List<MaterialClassesModel>;
                  tilesList.addAll(nameMaterialModelList.map((nextItem) {
                    return ListTile(
                      leading: const Icon(Icons.access_alarm),
                      title: Text(nextItem.nameClass),
                      subtitle: Text(
                          '${nextItem.numberUniqSubClass} Types and ${nextItem.numberUniqMaterials}'),
                      onTap: () {
                        s.idClass = nextItem.idClass;
                        s.nameClass = nextItem.nameClass;

                        print(' id = $idClass');
                        Get.toNamed(Routes.materialSubClasses);
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
        ],
      ),
    );
  }
}
