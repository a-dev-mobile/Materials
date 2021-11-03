import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/1_3_add/controller/add_c.dart';
import 'package:materials/pages/4_all_info/controller/info_controller.dart';
import 'package:materials/services/app_global_serv.dart';
import 'package:materials/utils/app_const.dart';

late AppGlobalServ sGlob = AppGlobalServ.to;
late AddController c = AddController.to;


class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: const Text('Добавить материал'),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Введите общую информацию о материале - который Вы хотите добавить...',
                style: AppConstTextStyle.label_extra_bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                  controller: controllerAddText,
                  maxLines: 10,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: const InputDecoration(
                      labelText: 'Марка, ГОСТ, применение, аналоги и др.',
                      hintText: 'Введите, что нибудь...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (controllerAddText.text.isNotEmpty) {
                    c.addMaterialToBase(text: controllerAddText.text);
                    controllerAddText.clear();
                    Get.snackbar('Спасибо', 'За предоставленную информацию');
                  }
                },
                child: const Text('Добавить'))
          ],
        ));
  }
}
