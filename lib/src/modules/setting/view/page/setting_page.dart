import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:materials/main.dart';
import 'package:materials/src/services/firebase_serv.dart';
import 'package:materials/src/services/translation_serv.dart';

FirebaseServ firebase = FirebaseServ.to;

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text(TranslateHelper.setting),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              FirebaseServ.to.getVersionOnlineDB();
             
            },
            child: Obx(() => Text('get version ${firebase.versionDB}'))),
      ),
    );
  }
}
