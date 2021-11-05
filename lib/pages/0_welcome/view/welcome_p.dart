import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/0_welcome/controller/welcome_c.dart';



import 'package:materials/routes/app_page.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('welcome'),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                Get.offAndToNamed(Routes.home);
      
              },
              child: Text('open app')),
        ));
  }
}
