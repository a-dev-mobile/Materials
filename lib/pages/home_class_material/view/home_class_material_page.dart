import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:materials/pages/home_class_material/controller/home_class_material_controller.dart';
import 'package:materials/pages/home_class_material/models/home_class_material_model.dart';

import 'package:materials/services/remote_controller.dart';

import 'package:materials/routes/app_page.dart';
import 'package:materials/services/global_serv.dart';
import 'package:materials/utils/logger.dart';

late HomeClassMaterialController c = HomeClassMaterialController.to;
late RemoteConfigController remote = RemoteConfigController.to;
late GlobalServ s = GlobalServ.to;

class HomeClassMaterialPage extends StatelessWidget {
  const HomeClassMaterialPage({Key? key}) : super(key: key);

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

                if (snapshot.hasData) {
                  final nameMaterialModelList =
                      snapshot.data as List<HomeClassMaterialModel>;
                  tilesList.addAll(nameMaterialModelList.map((nextItem) {
                    return ListTile(
                      leading: const Icon(Icons.access_alarm),
                      title: Text(nextItem.class_),
                      subtitle: Text(
                          '${nextItem.sumSubClass} Types and ${nextItem.sumGradle}'),
                      onTap: () {
                        s.idClass = nextItem.idClass;
                        s.nameClass = nextItem.class_;

                        print(' id = $idClass');
                        Get.toNamed(Routes.nameMaterial);
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
