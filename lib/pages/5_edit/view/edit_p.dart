import 'package:flutter/material.dart';
import 'package:materials/pages/4_all_info/controller/info_controller.dart';
import 'package:materials/services/app_global_serv.dart';

late AppGlobalServ sGlob = AppGlobalServ.to;

class EditPage extends StatelessWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('edit Data base material'),
        ),
        body: Column(
          children: [
            Text(
                '${sGlob.nameClass} > ${sGlob.nameSubMaterial} > ${sGlob.nameMaterial}'),
          
           Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                  controller: _controller,
                  maxLines: 10,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: const InputDecoration(
                      labelText: 'Марка, ГОСТ, применение, аналоги и др.',
                      hintText: 'Введите, что нибудь...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
            ),
          ],
        ));
  }
}
