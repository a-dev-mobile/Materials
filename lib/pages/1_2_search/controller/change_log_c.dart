import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:materials/pages/1_2_search/models/change_log_m.dart';
import 'package:materials/services/app_global_serv.dart';
import 'package:materials/services/app_remote_serv.dart';
import 'package:materials/utils/logger.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
late AppRemoteServ _sRemote = AppRemoteServ.to;

class ChangeLogController extends GetxController {
  List<ChangeLogModel> models = [];

  @override
  void onReady() {
    if (_sRemote.isUpdateDB) {
      viewDialogChangeLog();
    }
    super.onReady();
  }

  @override
  void onInit() {
    prepareTextJson();
    super.onInit();
  }

  void prepareTextJson() {
    Map valueMap = jsonDecode(_sRemote.changeLog);
    var listValues = [];
    // перебираю чтобы забрать значения без ключей
    valueMap.forEach((key, value) {
      listValues.add(value);
    });
    for (var value in listValues) {
      models.add(ChangeLogModel.fromJson(Map<String, dynamic>.from(value)));
    }
  }

  void viewDialogChangeLog() {
    var context = AppGlobalServ.navigatorKey.currentContext!;
    showDialog(
        barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          title:Text( AppLocalizations.of(context)!.updating_base,),
          content: Column(
            
                 mainAxisSize: MainAxisSize.max,
            children: _getListChangeData(),
          ),

          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context, 'OK');
                  //so that it won't show next time.
                  AppRemoteServ.to.isUpdateDB = false;
                },
                child: const Text('OK'))
          ],
        );
      },
    );
  }

  List<Widget> _getListChangeData() {
    List<Widget> listToPublish = [];
    for (var element in models) {
      listToPublish.add(
        Text(
          'Версия ${element.version}',
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );
      listToPublish.add(
        Text(
          element.date,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w300),
        ),
      );
      listToPublish.add(
        Text(
          element.changes,
          textAlign: TextAlign.start,
          style: const TextStyle(fontWeight: FontWeight.normal),
        ),
      );
      listToPublish.add(const Divider(height: 5,));
    }

    return listToPublish;
  }
}
