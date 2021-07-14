// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialModel _$MaterialModelFromJson(Map<String, dynamic> json) =>
    MaterialModel(
      anyInform: json['anyInform'] as String,
      category: json['category'] as String,
      chem: json['chem'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      use: json['use'] as String,
    );

Map<String, dynamic> _$MaterialModelToJson(MaterialModel instance) =>
    <String, dynamic>{
      'anyInform': instance.anyInform,
      'category': instance.category,
      'chem': instance.chem,
      'name': instance.name,
      'type': instance.type,
      'use': instance.use,
    };
