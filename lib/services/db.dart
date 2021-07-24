// ignore_for_file: avoid_print

import 'package:hive/hive.dart';
import 'package:materials/models/category_name.dart';
import 'package:materials/models/category_type.dart';
import 'package:materials/models/db.dart';
import 'package:materials/models/material.dart';

import '../const.dart';
import 'base_client.dart';

class DB {
  Future<bool> isOldLocal() async {
    var box = await Hive.openBox(ConstHive.settingBox);

    int onllineVersion = await _getDbOnlineVersion();
    int offlineVersion = await box.get(ConstHive.versionDbKey, defaultValue: 0);

    print('NetVersion $onllineVersion');
    print('LocalVersion $offlineVersion');

    if (onllineVersion != offlineVersion) {
      print('UPDATE data base');
      await box.put(ConstHive.versionDbKey, onllineVersion);

      box.close;

      return true;
    } else {
      print('no need to update');
      box.close();
      return false;
    }
  }

  Future<int> _getDbOnlineVersion() async {
    var response =
        await BaseClient().get(ConstUrlDB.baseUrl, ConstUrlDB.version);
    final versionModel = versionModelFromJson(response);
    final Db db = versionModel[0];
    return db.version;
  }

  Future<void> _toHiveCategoryType(Map<String, List<String>> map) async {
    String boxName = ConstHive.categoryTypeBox;
    var box = await Hive.openBox<CategoryType>(boxName);
    box.clear();
    CategoryType categoryType;
    for (var item in map.entries) {
      categoryType = CategoryType(category: item.key, type: item.value);
      box.add(categoryType);
    }
    print('OK save to box - $boxName');

  }

  Future<void> _toHiveCategoryName(Map<String, List<String>> map) async {
    String boxName = ConstHive.categoryNameBox;
    var box = await Hive.openBox<CategoryName>(boxName);
    box.clear();
    CategoryName categoryName;
    for (var item in map.entries) {
      categoryName = CategoryName(category: item.key, name: item.value);
      box.add(categoryName);
    }
    print('OK save to box - $boxName');

  }

  Future<void> updateLocalDB() async {
    var response =
        await BaseClient().get(ConstUrlDB.baseUrl, ConstUrlDB.material);
    final List<MaterialMod> materialsList = materialFromJson(response);

    List<String> categoryList = [];
    Map<String, String> categoryTypeDuplic = {};
    Map<String, String> categoryNameMapDuplic = {};

    for (MaterialMod item in materialsList) {
      categoryList.add(item.category);

      categoryTypeDuplic.update(
          item.category, (value) => value + '^' + item.type,
          ifAbsent: () => item.type);

      categoryNameMapDuplic.update(
          item.category, (value) => value + '^' + item.name,
          ifAbsent: () => item.name);
    }

    //deleted повторяющие values
    categoryList = categoryList.toSet().toList();
    Map<String, List<String>> categoryTypeMapUniq =
        _getUniqValues(categoryTypeDuplic);

    Map<String, List<String>> categoryNameMapUniq =
        _getUniqValues(categoryNameMapDuplic);

    print('общее кол категорий =  ${categoryList.length}');
    print('общее кол материалов =  ${materialsList.length}');

    await _toHiveCategoryType(categoryTypeMapUniq);
    await _toHiveCategoryName(categoryNameMapUniq);
  }

  Map<String, List<String>> _getUniqValues(Map<String, String> mapDuplic) {
    List<String> typeList = [];
    Map<String, List<String>> mapUniq = {};

    for (var item in mapDuplic.entries) {
      typeList = item.value.split('^').toSet().toList();
      mapUniq[item.key] = typeList;
    }

    return mapUniq;
  }
}
