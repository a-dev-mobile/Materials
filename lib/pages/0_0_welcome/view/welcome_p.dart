
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:materials/pages/1_1_classes/models/classes_m.dart';


import 'package:materials/routes/app_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('welcome'),
        ),
        body: Container(
          color: Colors.blueGrey,
          child: ElevatedButton(
              onPressed: () {
                Get.offAndToNamed(Routes.loadDB);
              },
              child: Text('to load DB')),
        ));
  }
}
