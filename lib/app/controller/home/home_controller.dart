// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:materials/app/data/model/category_name.dart';
import 'package:materials/app/data/model/category_type.dart';
import 'package:materials/app/data/services/db.dart';

import '../../../const.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    print('init controller home');
    load();
    super.onInit();
  }

  Future<void> load() async {
    print(1);
    await checkDB();
    print(2);
    await loadNameList();
    print(3);
    await loadTypeList();
  }

  Future<void> checkDB() async {
    DB db = DB();
    if (await db.isOldLocal()) {
      print('start update local DB');
      await db.updateLocalDB();
    } else {
      print('not update');
    }
  }

  final List<CategoryType> categoryTypeList = [];
  final List<CategoryName> categoryNameList = [];

  Future<void> loadNameList() async {
    Box<CategoryName> box =
        await Hive.openBox<CategoryName>(ConstHive.categoryNameBox);
    print("1start to load category name List");
    await loadToCategoryNameList(box);
    print("1end to load category name List");

    // box.close();
  }

  Future<void> loadToCategoryNameList(Box<CategoryName> box) async {
    for (CategoryName item in box.values) {
      categoryNameList.add(item);
    }

    print('_categoryNameList.length = ${categoryNameList.length}');
  }

  Future<void> loadToCategoryTypeList(Box<CategoryType> box) async {
    for (CategoryType item in box.values) {
      categoryTypeList.add(item);
    }
    print('_categoryTypeList.length = ${categoryTypeList.length}');
  }

  Future<void> loadTypeList() async {
    Box<CategoryType> box =
        await Hive.openBox<CategoryType>(ConstHive.categoryTypeBox);
    print("2start to load category type List");
    await loadToCategoryTypeList(box);
    print("2end to load category type List");

    // box.close();
  }
}
