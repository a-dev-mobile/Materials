// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/app/controller/home/home_controller.dart';

import '../../../../../const.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController c = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    print('build home page');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(ConstApp.name),
        ),
        body: buildListView(),
      ),
    );
  }

  ListView buildListView() {
    

    int size = c.categoryTypeList.length;
    print('buildListView ${c.categoryNameList.length}');
    return ListView.builder(
        itemCount: size,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 6,
            margin: EdgeInsets.all(8),
            child: ListTile(
              subtitle:Text(
                  // 'в категории количество типов = ${index}\nв категории количество материалов = ${index}')),
                  'в категории количество типов = ${c.categoryTypeList[index].type.length}\nв категории количество материалов = ${c.categoryNameList[index].name.length}'),
              onTap: () {
                print(c.categoryTypeList[index]);
              },
              title:Text(
                    c.categoryNameList[index].category,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            ),
          );
        });
  }
}
