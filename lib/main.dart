import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:materials/storage/file_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

void main() async {
  runApp(MyApp());
}

final TextStorage storage = TextStorage();

final DBRef = FirebaseDatabase.instance.reference();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('firebase'),
        ),
        body: FirstScreen(),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              writeData();
              print('writeData');
            },
            child: Text('write data'),
          ),
          ElevatedButton(
            onPressed: () {
              readData();
            },
            child: Text('read data'),
          ),
          ElevatedButton(
            onPressed: () {
              createFile();
            },
            child: Text('createFile'),
          ),
          ElevatedButton(
            onPressed: () {
              copyDataBase();
            },
            child: Text('copy database'),
          ),
        ],
      ),
    );
  }

  Future<void> writeData() async {
    DBRef.child('11').set({'4': 'w', '3': '1datatasdatdad', 'q': 'q'});
    DBRef.child('22').set({'id': '2ID2', 'data': '32datatatdad'});
  }

  Future<void> readData() async {
    // DBRef.child('materials/Бронза').once().then((DataSnapshot dataSnapshot) {
    int version = 0;

    await DBRef.child('version').once().then((DataSnapshot dataSnapshot) {
      version = dataSnapshot.value;
      print('version ${dataSnapshot.value.toString()}');

      showToastt('version $version');
    });
  }

  Future<void> createFile() async {
    storage.writeText("_co23423423unter", "123t.txt");
    print("createFile");
  }

  Future<void> copyDataBase() async {
    // DBRef.child('materials/Алюминий, сплав алюминия/Алюминиевые лигатуры/')
    // DBRef.child('materials/').once().then((DataSnapshot dataSnapshot) async {
    // int i = 0;

    // print('dataSnapshot.key ${dataSnapshot.key}');
    // print('dataSnapshot.length ${dataSnapshot.key!.length}');
    // print('==dataSnapshot.value ${dataSnapshot.value}');

    var url =
        Uri.parse('https://materials-9edc1.firebaseio.com/materials.json');
    var response = await http.post(url);
    print('Response status: ${response.statusCode}');

    String textJson = await http.read(url);

    print(textJson);
    storage.writeText(textJson, "123.json");
  }

// storage.writeJSON(dataSnapshot.value.toString().replaceAll("___", "\""));
// String? key = dataSnapshot.key;
// String? category = dataSnapshot.value['category'];
// String? chem = dataSnapshot.value['chem'];

// String content = '{"$key":{"category":"$category","chem":"$chem"}}';

// String textDB = dataSnapshot.value.toString();
// print('write $content');

// storage.writeJSON(content);

}

void showToastt(String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0);
}
