import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:materials/pages/class_sum/controller/class_sums_controller.dart';
import 'package:materials/pages/grade_subclass/controller/grade_sub_class_controller.dart';
import 'package:materials/routes/app_page.dart';
import 'package:materials/services/global_serv.dart';

late GradeSubClassController c = GradeSubClassController.to;
late GlobalServ s = GlobalServ.to;

class GradeSubClassPage extends StatelessWidget {
  const GradeSubClassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int idGrade = 0;
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.appTitle)),
      body: Column(
        children: [
          Text('Search'),
          Obx(() => Expanded(
              child: ListView.builder(
                  itemCount: c.gradeSubClassList.length,
                  itemBuilder: (BuildContext context, int index) {
                    // print({'URLLLL    ${c.getUrl('1.webp')}'});
                    return ListTile(
                      onTap: () {
                      
                        idGrade = c.gradeSubClassList[index].idClass;
                        s.idClass = idGrade;

                        print(' id = $idGrade');
                      },
                      leading: const Icon(Icons.access_alarm),
                      // leading: buildImage(index, w, h),
                      title: Text(c.sumClasses[index].class_),
                      subtitle: Text(
                          '${c.sumClasses[index].sumSubClass} Types and ${c.sumClasses[index].sumGradle} Grades of Materials\n'),
                    );
                  })))
        ],
      ),
    );
  }
}
