import 'package:flutter/material.dart';
import 'package:materials/app/controller/testy_controller.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({Key? key}) : super(key: key);

  final controller = TestController();

  @override
  Widget build(BuildContext context) {
    print('build CategoryPage');
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    controller.getData();
                  },
                  child: Text('click1')),
              ElevatedButton(
                  onPressed: () {
                    print('click2');
                  },
                  child: Text('click2')),
            ],
          ),
        ),
      ),
    );
  }
}
