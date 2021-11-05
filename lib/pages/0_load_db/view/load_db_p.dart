import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/0_load_db/controller/load_db_c.dart';

import 'package:materials/routes/app_page.dart';

class LoadDBPage extends GetView<LoadDBController> {
  const LoadDBPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('load DB'),
        ),
        body: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              controller.isCopyDB.value ? widgetIsLoad() : widgetIsNotLoad(),
              Visibility(
                visible: !controller.isCopyDB.value,
                  child: buildBtnNext()),
            ],
          );
        }));
  }

  Widget buildBtnNext() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ElevatedButton(
                      onPressed: () {
                        Get.offAndToNamed(Routes.welcome);
                      },
                      child: Text('Next')),
    );
  }

  Center widgetIsNotLoad() {
    return const Center(child: Text('БАза скопирована'));
  }

  Center widgetIsLoad() {
    return const Center(
        child: Text('подождите идет копирование базы данных на телеф...'));
  }
}
