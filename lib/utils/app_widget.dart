import 'package:flutter/material.dart';
import 'package:materials/services/app_global_serv.dart';

import 'app_const.dart';

class AppWidget {
  static Widget title({required String title}) {
    // BuildContext context = AppGlobalServ.navigatorKey.currentContext!;
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Text(
          title,
          style: AppConstTextStyle.H3,
        ),
      ),
    );
  }
}
