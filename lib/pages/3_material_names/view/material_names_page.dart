import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/3_material_names/controller/material_names_controller.dart';
import 'package:materials/pages/3_material_names/models/material_names_model.dart';


import 'package:materials/routes/app_page.dart';
import 'package:materials/services/app_global_serv.dart';

late MaterialNamesController c = MaterialNamesController.to;
late AppGlobalServ s = AppGlobalServ.to;

class MaterialNamesPage extends StatelessWidget {
  const MaterialNamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MaterialNamesModel> modelList;

    return Scaffold(
      appBar: AppBar(title: Text(s.nameClass)),
      body: Column(
        children: [
          const Text('Search'),
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
                        title: Text( modelList[index].nameMaterial),
                        subtitle: Text(
                            modelList[index].nameOtherMaterial),
                        onTap: () {
                          s.idMaterial =  modelList[index].idMaterial;
                          Get.toNamed(Routes.allInfo);
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
