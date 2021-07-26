// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:materials/app/data/model/category_name.dart';
import 'package:materials/app/data/model/category_type.dart';

import '../../../../../const.dart';



List<CategoryType> categoryTypeList = [];
List<CategoryName> categoryNameList = [];

Future<void> loadToListsFromHive() async {
  await loadTypeList();
  await loadNameList();
}

Future<void> loadNameList() async {
  Box<CategoryName> box =
      await Hive.openBox<CategoryName>(ConstHive.categoryNameBox);

  for (CategoryName item in box.values) {
    print('name');
    print(item.toString());
    categoryNameList.add(item);
  }
  print("categoryNameList.length");
  print(categoryNameList.length);
  // box.close();
}

Future<void> loadTypeList() async {
  Box<CategoryType> box =
      await Hive.openBox<CategoryType>(ConstHive.categoryTypeBox);

  for (CategoryType item in box.values) {
    print('type');
    print(item.toString());
    categoryTypeList.add(item);
  }
  print("categoryTypeList.length");
  print(categoryTypeList.length);
  // box.close();
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   void initState() {
//     print('init');
//     loadToListsFromHive();
//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(ConstApp.name),
        ),
        body: Container(
          child: Column(
            children: [
               ElevatedButton(
                    onPressed: () {
                      print('click');
                    },
                    child: Text('click')),
              buildListView(),
            ],
          ),
        ),
      ),
    );
  }

  ListView buildListView() {
    int size = categoryTypeList.length;
    print('buildListView $size');

    return ListView.builder(
        itemCount: size,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 6,
            margin: EdgeInsets.all(8),
            child: ListTile(
              subtitle: Text(
                  'в категории количество типов = ${categoryTypeList[index].type.length}\nв категории количество материалов = ${categoryNameList[index].name.length}'),
              onTap: () {
                print(categoryTypeList[index]);
              },
              title: Text(
                categoryNameList[index].category,
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
