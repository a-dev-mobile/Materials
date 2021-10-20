import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/home/controller/home_controller.dart';

late HomeController c = HomeController.to;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<HomeController>(() => HomeController());
    return Scaffold(
      appBar: AppBar(title: Text('Materials')),
      body: Column(
        children: [
          Obx(() => Expanded(
              child: ListView.builder(
                  itemCount: c.sumClasses.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(Icons.male),
                      title: Text(c.sumClasses[index].class_),
                      subtitle: Text(
                          '${c.sumClasses[index].sumSubClass} Types and ${c.sumClasses[index].sumGradle} Grades of Materials\n'),
                    );
                  })))
        ],
      ),
    );
  }
}
