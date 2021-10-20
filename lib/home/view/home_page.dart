import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/home/controller/home_controller.dart';
import 'package:materials/services/remote_config.dart';

late HomeController c = HomeController.to;
late RemoteConfigServices s = RemoteConfigServices.to;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<HomeController>(() => HomeController());
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Obx(() => Text(s.appName.value))),
      body: Column(
        children: [
          Obx(() => Expanded(
              child: ListView.builder(
                  itemCount: c.sumClasses.length,
                  itemBuilder: (BuildContext context, int index) {
                    // print({'URLLLL    ${c.getUrl('1.webp')}'});
                    return ListTile(
                      onTap: () {
                        print(' id = ${c.sumClasses[index].id}');
                      },
                      leading: const Icon(Icons.access_alarm),
                      // leading: buildImage(index, w, h),
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
