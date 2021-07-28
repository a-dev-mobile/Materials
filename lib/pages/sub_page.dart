
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/controller/home_controller.dart';

class SubPage extends StatelessWidget {
  const SubPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(HomeController());
    print('build');  
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Obx(() => Text('2222incre ${c.i}')),
        ),
        body: Center(
          child: Column(
            children: [
              FloatingActionButton(
                  backgroundColor: Colors.amber,
                  heroTag: "btn3",
                  onPressed: () {
                    c.increment();
                  }),
                FloatingActionButton(
                  backgroundColor: Colors.blue,
                  heroTag: "btn4",
                  child: Text('to home'),
                  onPressed: () {
                
                    Get.back();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
