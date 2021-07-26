import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  static void showErrorDialog(
      {String title = 'Error', String description = ''}) {
    Get.dialog(Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Get.textTheme.headline4,
            ),
            Text(
              description,
              style: Get.textTheme.headline6,
            ),
            ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen!) {
                    Get.back();
                  }
                },
                child: Text('ok')),
          ],
        ),
      ),
    ));
  }

  static void showLoading([String message = 'Loading...']) {
    Get.dialog(Dialog(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const LinearProgressIndicator(),
            const SizedBox(height: 16),
            Text(message),
          ],
        ),
      ),
    ));
  }

  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}
