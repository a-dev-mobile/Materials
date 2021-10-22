import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:materials/pages/home_class_material/controller/home_class_material_controller.dart';

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
          Obx(() => Expanded(
              child: ListView.builder(
                  itemCount: c.sumClasses.length,
                  itemBuilder: (BuildContext context, int index) {
                    // print({'URLLLL    ${c.getUrl('1.webp')}'});
                    return ListTile(
                      onTap: () {
                        Get.toNamed(Routes.nameMaterial);
                        idClass = c.sumClasses[index].idClass;
                        // TODO save data for page 2
                        s.idClass = idClass;
                        s.nameClass = c.sumClasses[index].class_;

                        print(' id = $idClass');
                      },
                      leading: const Icon(Icons.access_alarm),
                      // leading: buildImage(index, w, h),
                      title: Text(c.sumClasses[index].class_),
                      subtitle: Text(
                          '${c.sumClasses[index].sumSubClass} Types and ${c.sumClasses[index].sumGradle} Grades of Materials\n'),
                    );
                  })))
        ],
      ),
    );
  }
}
