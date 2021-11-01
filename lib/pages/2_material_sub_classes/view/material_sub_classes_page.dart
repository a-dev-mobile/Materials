import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/2_material_sub_classes/controller/material_sub_classes_controller.dart';
import 'package:materials/pages/2_material_sub_classes/models/material_sub_classes_model.dart';


import 'package:materials/routes/app_page.dart';
import 'package:materials/services/app_global_serv.dart';

late MaterialSubClassesController c = MaterialSubClassesController.to;
late AppGlobalServ s = AppGlobalServ.to;

class MaterialSubClassesPage extends StatelessWidget {
  const MaterialSubClassesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<MaterialSubClassesModel> modelList;

    return Scaffold(
      appBar: AppBar(title: Text(s.nameClass)),
      body: Column(
        children: [

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
