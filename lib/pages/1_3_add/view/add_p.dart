import 'package:flutter/material.dart';
import 'package:materials/pages/1_3_add/controller/add_c.dart';
import 'package:materials/pages/4_all_info/controller/info_controller.dart';
import 'package:materials/services/app_global_serv.dart';

late AppGlobalServ sGlob = AppGlobalServ.to;
late AddController c = AddController.to;

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add new Data base material'),
        ),
        body: Column(
          children: [
            Text(
                '${sGlob.nameClass} > ${sGlob.nameSubMaterial} > ${sGlob.nameMaterial}'),
            ElevatedButton(
                onPressed: () {
                  c.addMaterialToBase(name: '45', desc: 'asd');
                },
                child: Text('Add new Material'))
          ],
        ));
  }
}
