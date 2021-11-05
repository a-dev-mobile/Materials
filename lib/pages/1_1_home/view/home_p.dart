import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/1_1_home/controller/home_c.dart';
import 'package:materials/pages/1_1_home/models/home_m.dart';

import 'package:materials/routes/app_page.dart';
import 'package:materials/services/app_global_serv.dart';
import 'package:materials/translations/translate_helper.dart';
import 'package:materials/utils/app_const.dart';
import 'package:materials/utils/logger.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<HomeModel> models = [];

    return Scaffold(
      appBar: AppBar(
        title: Text(TranslateHelper.app_title),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.info_outline))
        ],
      ),
      body: Column(
        children: [
          buildSearch(),
          FutureBuilder(
            future: controller.openDB(),
            builder: (context, snapshot) {
              log.i(snapshot.connectionState);
              if (snapshot.hasData) {
                models = snapshot.data as List<HomeModel>;
                return Expanded(
                  child: ListView.builder(
                    itemCount: models.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(models[index].nameClass),
                      );
                    },
                  ),
                );
              } else
                return LinearProgressIndicator();
            },
          )
        ],
      ),
    );
  }

  Widget buildSearch() {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppConstColor.neutral_grey_800, width: 1)),
      child: ListTile(
        leading: const Icon(Icons.search),
        onTap: () {
          Get.toNamed(Routes.search);
        },
        title: Text(
          TranslateHelper.search_title,
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
