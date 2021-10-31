import 'package:flutter/material.dart';

class MaterialAllInfoPage extends StatelessWidget {
   MaterialAllInfoPage({Key? key}) : super(key: key);
  int selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.connect_without_contact),
            label: 'Info'
          ),
                   BottomNavigationBarItem(
            icon: Icon(Icons.code_off),
            label: 'Chem'
          ),
        ],
      ),
    );
  }
}
