// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

bool isUpdateDB = false;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {},
                child: const Text('get Online Version DB'),
              ),
              ElevatedButton(
                onPressed: () async {},
                child: const Text('update Offline Version DB'),
              ),
              ElevatedButton(
                onPressed: () async {},
                child: const Text('to hive'),
              ),
              ElevatedButton(
                onPressed: () async {
                  // var box = await Hive.openBox(ConstHive.categoryTypeBox);

                  // List<CategoryType> categoryTypeList = [];

                  // for (CategoryType item in box.values) {
                  //   categoryTypeList.add(item);
                  // }
                  // print(categoryTypeList[0].category);
                  // print(categoryTypeList[0].type);

                  // print(box.values.length);
                  // _boxClose(box);
                },
                child: const Text('from hive type'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
