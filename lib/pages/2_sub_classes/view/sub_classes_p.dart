import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/2_sub_classes/controller/sub_classes_c.dart';
import 'package:materials/pages/2_sub_classes/models/sub_classes_m.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:materials/routes/app_page.dart';
import 'package:materials/services/app_global_serv.dart';
import 'package:materials/utils/app_widget.dart';

late SubClassesController c = SubClassesController.to;
late AppGlobalServ s = AppGlobalServ.to;

class SubClassesPage extends StatelessWidget {
  const SubClassesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<SubClassesModel> modelList;

    return Scaffold(
      appBar: AppBar(title: Text(s.nameClass)),
      body: Column(
        children: [
  AppWidget.title(
            title: AppLocalizations.of(context)!.select_material,
          ),
          FutureBuilder(
            // get futture data
            future: c.getFutureData(),
            builder:
                (BuildContext context, AsyncSnapshot<DataSnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                modelList = c.getModelList(snapshot);
                return Expanded(
                  child: ListView.builder(
                    itemCount: modelList.length,
                    itemBuilder: (context, index) {
                    
                      return ListTile(
                        title: Text( modelList[index].nameSubClass),
                        trailing: Text(
                            '${ modelList[index].numberUniqMaterial}'),
            
                        onTap: () {
                               s.idSubClass =  modelList[index].idSubClass;
                               s.idClass =  modelList[index].idClass;
                               s.nameSubMaterial =  modelList[index].nameSubClass;
                          Get.toNamed(Routes.names);
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
}
