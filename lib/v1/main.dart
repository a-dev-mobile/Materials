import 'dart:convert';

import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double value;

  String json = '''
  {
    "success": true,
    "data": {
        "ones": [{
                "id": "2",
                "username": "LM10002"
            },
            {
                "id": "6",
                "username": "LM10006"
            }
        ],
        "twos": [{
                "id": "3",
                "username": "LM10003"
            },
            {
                "id": "8",
                "username": "LM10008"
            }
        ],
        "threes": [{
            "id": "4",
            "username": "LM10004"
        }],
        "fours": [{
                "id": "5",
                "username": "LM10005"
            },
            {
                "id": "14",
                "username": "GT10014"
            }
        ]
    }
}
  
  ''';
  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() {
    Map mapValue = jsonDecode(json);
    // This is where you iterate via the data object
    // that is the value which is key,value pair
    List<Data> data = [];
    mapValue['data'].forEach((key, value) {
      List<User> user = [];
      value.forEach((item) {
        user.add(User(id: item['id'], username: item['username']));
      });
      data.add(Data(name: key, userList: user));
    });

    data.forEach((element) {
      print(element.name + " : " + '${element.userList.length}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Text('s')),
    );
  }
}

class Data {
  final String name;
  final List<User> userList;

  Data({required this.name, required this.userList});
}

class User {
  final String id;
  final String username;

  User({required this.id, required this.username});
}
