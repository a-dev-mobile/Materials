import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/4_all_info/controller/chem_c.dart';
import 'package:materials/routes/app_page.dart';
import 'package:materials/services/app_global_serv.dart';
import 'package:materials/utils/app_const.dart';
import 'package:materials/utils/logger.dart';

late ChemController c = ChemController.to;
late AppGlobalServ sGlob = AppGlobalServ.to;

class ChemWidget extends StatelessWidget {
  const ChemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Column(
          children: [
            Text(sGlob.nameMaterial),
            const Text(
              'Хим состав',
              style: AppConstTextStyle.label_extra_bold,
            )
          ],
        ),
          actions: [
            IconButton(
              onPressed: () {
                c.isReverse.value = !(c.isReverse.value);
              },
              icon: const Icon(Icons.align_horizontal_left_sharp),
            ),
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.edit);
              },
              icon: const Icon(Icons.edit),
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
                return const LinearProgressIndicator();
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
    log.i(list.length);
    //if there is no data on chemical 
    if (list.isEmpty) {
      toPublish.add(const Center(
        child: Text(
          'Нет данных',
          style: AppConstTextStyle.H3,
        ),
      ));
      return toPublish;
    }
    for (var model in list) {
      toPublish.add(Stack(
        children: [
          Container(
            width: (Get.width * (model.percent / maxValue)) * 1,
            height: 40,
            color: Colors.amber,
          ),
          ListTile(
            leading: Text(model.abrv),
            title: Text(c.getTranslateTitle(model.abrv)),
            trailing: Text('${c.getChangeValue(model.value)} %'),
          ),
        ],
      ));
    }

    return toPublish;
  }
}
