import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/4_all_info/controller/all_info_controller.dart';
import 'package:materials/pages/4_all_info/view/chem_w.dart';
import 'package:materials/pages/4_all_info/view/info_w.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:materials/services/app_global_serv.dart';

late AllInfoController c = AllInfoController.to;
late AppGlobalServ sGlob = AppGlobalServ.to;

class AllInfoPage extends StatelessWidget {
  AllInfoPage({Key? key}) : super(key: key);
  int selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => buildBottomBar()),
      body: Obx(() => getBody()),

      // body: ,
    );
  }

  Widget getBody() {
    switch (c.currentIndex.value) {
      case 0:
        return const InfoWidget();
      case 1:
        return const ChemWidget();
    }
    return const InfoWidget();
  }

  BottomNavigationBar buildBottomBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: c.currentIndex.value,
      onTap: c.changeCurrentIndex,
      items:  [
        BottomNavigationBarItem(
            icon: Icon(Icons.info), label: AppLocalizations.of(AppGlobalServ.navigatorKey.currentContext!)!.info),
        BottomNavigationBarItem(icon: Icon(Icons.analytics), label: AppLocalizations.of(AppGlobalServ.navigatorKey.currentContext!)!.chem_composition),
      ],
    );
  }
}
