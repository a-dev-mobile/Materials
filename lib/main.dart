// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:materials/model/category.dart';
import 'package:materials/model/db.dart';
import 'package:materials/services/base_client.dart';

import 'const.dart';

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
                      await BaseClient().get(UrlDB.baseUrl, UrlDB.type);
                  final List<Category> category = categoryFromJson(response);

                  for (Category item in category) {
                    print(item.name);
                    print(item.type);
                  }
                },
                child: const Text('get category'),
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
