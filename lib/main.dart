import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:materials/model/material.dart';
import 'package:materials/model/album.dart';
import 'package:materials/services/base_client.dart';

import 'api_client.dart';
import 'const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  runApp(MyApp());
}

Future<DatabaseReference> initFireBase() async {
  DatabaseReference dbRef = FirebaseDatabase.instance.reference();
  return dbRef;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
                  int ver = await getOnlineVersionDB();
                  print('getOnlineVersionDB() == $ver');
                },
                child: Text('get Online Version DB'),
              ),
              ElevatedButton(
                onPressed: () {
                  updateOfflineVersionDB();
                },
                child: Text('update Offline Version DB'),
              ),
              ElevatedButton(
                  onPressed: () async {
                    var response = await BaseClient().get(
                        'https://materials-9edc1.firebaseio.com',
                        '/materials.json');
                    print(response);
                  },
                  child: Text('read json')),
              ElevatedButton(
                onPressed: () async {
                  var response = await BaseClient()
                      .get('https://jsonplaceholder.typicode.com', '/todos/1');
                  print(response);
                },
                child: Text('new read json'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateOfflineVersionDB() async {
    var box = await Hive.openBox(HiveKeys.setting);

    int onllineVersion = await getOnlineVersionDB();
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

  Future<int> getOnlineVersionDB() async {
    DataSnapshot dataSnapshot =
        await FirebaseDatabase.instance.reference().child('version').once();

    print('dataSnapshot ${dataSnapshot.toString()}');
    var version = dataSnapshot.value;
    if (version != null) {
      return version;
      /**/
    } else {
      return 0;
    }
  }
}
