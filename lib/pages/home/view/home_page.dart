import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:materials/pages/home/controller/home_controller.dart';
import 'package:materials/pages/home/controller/remote_controller.dart';

import 'package:materials/routes/app_page.dart';
import 'package:materials/services/global_serv.dart';
import 'package:materials/utils/logger.dart';

late HomeController c = HomeController.to;
late RemoteConfigController remote = RemoteConfigController.to;
late GlobalServ s = GlobalServ.to;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int idClass = 0;

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.appTitle)),
      body: Column(
        children: [Text('Search'), Text('Search ${remote.versionDB}')],
      ),
    );
  }
}
