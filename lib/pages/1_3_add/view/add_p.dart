import 'package:flutter/material.dart';
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
          title: const Text('Добавить новый материал'),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Введите общую информацию о марке материала - который Вы хотите добавить...',
                style: AppConstTextStyle.label_extra_bold,
              ),
            ),
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                maxLines: 10,
                decoration: InputDecoration(
                    labelText: 'Марка, ГОСТ, применение и др.',
                    hintText: 'Введите что нибудь...',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  c.addMaterialToBase(name: '45', desc: 'asd');
                },
                child: const Text('Добавить'))
          ],
        ));
  }
}
