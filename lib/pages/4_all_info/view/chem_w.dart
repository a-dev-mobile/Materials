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
              icon: Icon(Icons.align_horizontal_left_sharp),
            ),
          ],
        ),
        body: Obx(() {
          return FutureBuilder(
            future: c.getfuture(c.isReverse.value),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SingleChildScrollView(
                    child: Column(children: buildChemWidget()));
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
    double maxValue = 0;
    // I find max value
    for (var model in list) {
      if (maxValue <= model.percent) {
        maxValue = model.percent;
      }
    }

    for (var model in list) {
      toPublish.add(Stack(
        children: [
          Container(
            width: (Get.width * (model.percent / maxValue))*1,
            height: 40,
            color: Colors.amber,
          ),
          ListTile(
            leading: Text(model.abrv),
            title: Text(model.name),
            trailing: Text(model.value),
          ),
        ],
      ));
    }

    return toPublish;
  }
}
