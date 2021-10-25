import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MaterialInfoPage extends StatefulWidget {
  MaterialInfoPage() : super();


  @override
  _MaterialInfoPageState createState() => _MaterialInfoPageState();
}

class _MaterialInfoPageState extends State<MaterialInfoPage> {
  late List<SalesData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SfCartesianChart(
      title: ChartTitle(text: 'Yearly sales analysis'),
      legend: Legend(isVisible: true),
      tooltipBehavior: _tooltipBehavior,
      series: <ChartSeries>[
        LineSeries<SalesData, double>(
            name: 'Sales',
            dataSource: _chartData,
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
            dataLabelSettings: DataLabelSettings(isVisible: true),
            enableTooltip: true)
      ],
      primaryXAxis: NumericAxis(
        edgeLabelPlacement: EdgeLabelPlacement.shift,
      ),
      primaryYAxis: NumericAxis(
          labelFormat: '{value}M',
          numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
    )));
  }

  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData(2017, 25),
      SalesData(2018, 12),
      SalesData(2019, 24),
      SalesData(2020, 18),
      SalesData(2021, 30)
    ];
    return chartData;
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final double year;
  final double sales;
}



// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import 'package:materials/pages/4_material_info/controller/material_info_controller.dart';
// import 'package:materials/pages/4_material_info/models/material_info_model.dart';
// import 'package:materials/pages/4_material_info/view/material_chem.dart';

// import 'package:materials/services/app_remote_serv.dart';

// import 'package:materials/routes/app_page.dart';
// import 'package:materials/services/app_global_serv.dart';
// import 'package:materials/utils/logger.dart';

// late MaterialInfoController c = MaterialInfoController.to;
// late AppGlobalServ s = AppGlobalServ.to;

// class MaterialInfoPage extends StatelessWidget {
//   const MaterialInfoPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     int idGrade = 0;
//     MaterialInfoModel model;

//     return Scaffold(
//       appBar: AppBar(title: Text(s.nameClass)),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Text('Search'),
//             FutureBuilder(
//               // get futture data
//               future: c.getFutureData(),
//               builder:
//                   (BuildContext context, AsyncSnapshot<DataSnapshot> snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done) {
//                   model = c.getModel(snapshot);
//                   return Column(children: [
//       Text(model.nameMaterial),
//       Text(model.nameMaterial),
//       Text(model.nameMaterial),
//       Text(model.nameMaterial),
//       Text(model.nameMaterial),
//       Text(model.nameMaterial),
//       Text(model.nameMaterial),
//       Text(model.nameMaterial),
//       Text(model.nameMaterial),
//       Text(model.nameMaterial),
//       Text(model.nameMaterial),
//       Text(model.nameMaterial),
//       Text(model.nameMaterial),
//       Text(model.nameMaterial),
//       Text(model.nameMaterial),
//       Text(model.nameMaterial),
//       Text(model.nameMaterial),
//       Text(model.nameMaterial),
//       Text(model.nameMaterial),
//       Text(model.nameMaterial),
//       Text(model.nameClass),
//       Text(model.nameSubClass),
//       Text(model.nameOtherMaterial),
//       Text(model.addInfo),
     
//       Text(model.replaceMaterial),
//       Text(model.use),
      
      
      
      
//                   ]);
//                 } else {
//                   return const LinearProgressIndicator();
//                 }
//               },
//             ),
         
         
//          MaterialChemWidget()
//           ],
//         ),
//       ),
//     );
//   }
// }
