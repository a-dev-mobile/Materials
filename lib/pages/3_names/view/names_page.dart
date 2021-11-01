import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/3_names/controller/names_c.dart';
import 'package:materials/pages/3_names/models/names_m.dart';




import 'package:materials/routes/app_page.dart';
import 'package:materials/services/app_global_serv.dart';

late NamesController c = NamesController.to;
late AppGlobalServ s = AppGlobalServ.to;

class NamesPage extends StatelessWidget {
  const NamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<NamesModel> modelList;

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
                          s.nameMaterial =  modelList[index].nameMaterial;
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
