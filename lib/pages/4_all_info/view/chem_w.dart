import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:materials/pages/4_all_info/controller/chem_controller.dart';




late ChemController c = ChemController.to;


class ChemWidget extends StatelessWidget {
  const ChemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Map<String, String> mapChem = {};
    return Scaffold(
     
        body:SingleChildScrollView(
          child: Column(children: [
                // Text('Search'),
                       
                FutureBuilder(
                  future: c.getFutureDataChem(),
                  builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      mapChem = c.getMapChem(snapshot);
                        
                      return ListView.builder(
                        shrinkWrap:true,
                        itemCount: mapChem.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Text(mapChem.keys.elementAt(index)),
                            trailing: Text(mapChem.values.elementAt(index)),
                          );
                        },
                      );
                    } else {
                      return LinearProgressIndicator();
                    }
                  },
                ),
              
                // const Expanded(
                //   flex: 1,
                //   child: Placeholder()
                // ),
              ]
            
          ),
        ));
  }

  List<Widget> buildChemWidget(Map<String, String> mapChem) {
    List<Widget> chem = <Widget>[];

    mapChem.forEach((k, v) {
      chem.add(Column(
        children: [Text(k), Text(v)],
      ));
    });

    return chem;
  }
}
