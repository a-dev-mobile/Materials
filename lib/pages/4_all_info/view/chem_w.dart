import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/4_all_info/controller/chem_c.dart';
import 'package:materials/services/app_global_serv.dart';

late ChemController c = ChemController.to;
late AppGlobalServ sGlob = AppGlobalServ.to;

class ChemWidget extends StatelessWidget {
  const ChemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('chem ${sGlob.nameMaterial}'),
          actions: [
            IconButton(
              onPressed: () {
                c.isReverse.value = !(c.isReverse.value);
              },
              icon: Icon(Icons.ac_unit_outlined),
            ),
          ],
        ),
        body: Obx(() {
          return FutureBuilder(
            future: c.getfuture(c.isReverse.value),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(children: buildChemWidget());
              } else {
                return LinearProgressIndicator();
              }
            },
          );
        })

        // Obx(() {
        //   return c.isLoad.value
        //       ? const LinearProgressIndicator()
        //       : Column(children: buildChemWidget());
        // })

        );
  }

  List<Widget> buildChemWidget() {
    List<Widget> toPublish = <Widget>[];
    var list = c.listModel;

    for (var model in list) {
      toPublish.add(Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(model.abrv),
          Text(model.name),
          Text('${model.percent}%'),
          Text(model.value)
        ],
      ));
    }

    return toPublish;
  }
}
