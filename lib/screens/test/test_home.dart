// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:materials/models/db.dart';
import 'package:materials/models/material.dart';

import 'package:materials/services/base_client.dart';

import '../../const.dart';

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
                onPressed: () async {
                  int version = await getDbOnlineVersion();
                  print('getOnlineVersionDB() == $version');
                },
                child: const Text('get Online Version DB'),
              ),
              ElevatedButton(
                onPressed: () async {
                  isUpdateDB = await isUpdateOfflineDB();

                  if (isUpdateDB) {
                    await updateOfflineDB();
                  }
                },
                child: const Text('update Offline Version DB'),
              ),
              ElevatedButton(
                onPressed: () async {
                  var box = await Hive.openBox(ConstHive.categoryTypeBox);
                  List<String> values = [];

                  for (var item in box.keys) {
                    values = box.get(item);
                    print('category = $item type = $values');
                    
                    
                  }
                },
                child: const Text('get from hive'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('test 1'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateOfflineDB() async {
    var response =
        await BaseClient().get(ConstUrlDB.baseUrl, ConstUrlDB.material);
    final List<MaterialMod> materialsList = materialFromJson(response);

    List<String> categoryList = [];
    Map<String, String> categoryTypeDuplic = {};
    Map<String, String> categoryNameMapDuplic = {};

    for (MaterialMod item in materialsList) {
      categoryList.add(item.category);

      categoryTypeDuplic.update(
          item.category, (value) => value + '^' + item.type,
          ifAbsent: () => item.type);

      categoryNameMapDuplic.update(
          item.category, (value) => value + '^' + item.name,
          ifAbsent: () => item.name);
    }

    //deleted повторяющие values
    categoryList = categoryList.toSet().toList();
    Map<String, List<String>> categoryTypeMapUniq =
        getUniqType(categoryTypeDuplic);

    Map<String, List<String>> categoryNameMapUniq =
        getUniqType(categoryNameMapDuplic);

    print('общее кол категорий =  ${categoryList.length}');
    print('общее кол материалов =  ${materialsList.length}');

    await toHive(ConstHive.categoryTypeBox, categoryTypeMapUniq);
    await toHive(ConstHive.categoryNameBox, categoryNameMapUniq);

    for (var item in categoryNameMapUniq.entries) {
      print("**");
      print(
          "Материал = ${item.key},  кол материалов = ${item.value.length} типы = ${item.value}");
      print("**");
    }

    for (var item in categoryTypeMapUniq.entries) {
      print("==");
      print(
          "Материал = ${item.key},  кол подтипов = ${item.value.length} типы = ${item.value}");
      print("==");
    }
  }

  Map<String, List<String>> getUniqType(Map<String, String> typeMapDuplic) {
    List<String> typeList = [];
    Map<String, List<String>> typeMapListString = {};
    for (var item in typeMapDuplic.entries) {
      typeList = item.value.split('^').toSet().toList();
      typeMapListString[item.key] = typeList;
    }

    return typeMapListString;
  }

  Future<int> getDbOnlineVersion() async {
    var response =
        await BaseClient().get(ConstUrlDB.baseUrl, ConstUrlDB.version);
    final versionModel = versionModelFromJson(response);
    final Db db = versionModel[0];
    return db.version;
  }

  Future<void> toHive(String boxName, Map<String, List<String>> map) async {
    var box = await Hive.openBox(boxName);
    print('start save to box $boxName');
    for (var item in map.entries) {
      box.put(item.key, item.value);
    }
    box.close();
    print('end save to box $boxName');
  }

  Future<bool> isUpdateOfflineDB() async {
    var box = await Hive.openBox(ConstHive.settingBox);

    int onllineVersion = await getDbOnlineVersion();
    int offlineVersion = await box.get(ConstHive.versionDbKey, defaultValue: 0);

    print('onllineVersion $onllineVersion');
    print('offlineVersion $offlineVersion');

    if (onllineVersion != offlineVersion) {
      print('UPDATE data base');
      await box.put(ConstHive.versionDbKey, onllineVersion);
      box.close();
      return true;
    } else {
      print('no need to update');
      return false;
    }
  }
}
