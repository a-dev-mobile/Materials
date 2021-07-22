// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:materials/model/db.dart';
import 'package:materials/services/base_client.dart';

import 'const.dart';
import 'model/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  runApp(const MyApp());
}

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
                  await updateOfflineVersionDB();
                },
                child: const Text('update Offline Version DB'),
              ),
              ElevatedButton(
                  onPressed: () async {
                    var response =
                        await BaseClient().get(UrlDB.baseUrl, UrlDB.type);
                    print(response);
                  },
                  child: const Text('read json')),
              ElevatedButton(
                onPressed: () async {
                  var response =
                      await BaseClient().get(UrlDB.baseUrl, UrlDB.material);
                  final List<MaterialMod> materialsList =
                      materialFromJson(response);

                  List<String> categoryList = [];
                  Map<String, List<String>> typeMap = {};

                  List<String> addData = [];

                  for (MaterialMod item in materialsList) {
                    categoryList.add(item.category);

                    addData.add(item.type);
                    print(item.type);
                    // typeMap.update(item.category, (value) => item.type));

                    // print(item.name);
                    // print(item.type);
                    addData.clear();
                  }

                  //deleted повторяющие values
                  categoryList = categoryList.toSet().toList();
                  print('общее кол категорий =  ${categoryList.length}');
                  print('общее кол матералов =  ${materialsList.length}');

                  for (var item in typeMap.entries) {
                    print("${item.key} - ${item.value}");
                  }
                },
                child: const Text('get all material'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<int> getDbOnlineVersion() async {
    var response = await BaseClient().get(UrlDB.baseUrl, UrlDB.version);
    final versionModel = versionModelFromJson(response);
    final Db db = versionModel[0];
    return db.version;
  }

  Future<void> updateOfflineVersionDB() async {
    var box = await Hive.openBox(HiveKeys.setting);

    int onllineVersion = await getDbOnlineVersion();
    int offlineVersion = await box.get(HiveKeys.versionDB, defaultValue: 0);

    print('onllineVersion $onllineVersion');
    print('offlineVersion $offlineVersion');

    if (onllineVersion != offlineVersion) {
      print('UPDATE data base');
      await box.put(HiveKeys.versionDB, onllineVersion);
    } else {
      print('no need to update');
    }

    box.close();
  }
}
