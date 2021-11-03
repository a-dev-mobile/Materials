import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/4_all_info/controller/info_c.dart';
import 'package:materials/pages/5_edit/controller/edit_c.dart';
import 'package:materials/services/app_global_serv.dart';
import 'package:materials/utils/app_const.dart';

late AppGlobalServ _sGlob = AppGlobalServ.to;
late EditController _cEdit = EditController.to;

class EditPage extends StatelessWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Предложить исправления'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                '${_sGlob.nameClass} > ${_sGlob.nameSubClass} > ${_sGlob.nameMaterial}',
                style: AppConstTextStyle.label_extra_bold,
              ),
                    const SizedBox(
              height: 20,
            ),
              TextField(
                controller: _cEdit.textController,
                maxLines: 10,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                    labelText: 'Нашли ошибку или необходимо добавить',
                    hintText: 'Введите, что нибудь...',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_cEdit.textController.text.isNotEmpty) {
                      _cEdit.editMaterial(text: _cEdit.textController.text);
                      _cEdit.textController.clear();
                      Get.snackbar('Спасибо', 'За предоставленную информацию');
                    }
                  },
                  child: const Text('Добавить'))
            ],
          ),
        ));
  }
}
