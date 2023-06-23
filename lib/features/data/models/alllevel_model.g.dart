// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alllevel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllLevelModel _$AllLevelModelFromJson(Map<String, dynamic> json) =>
    AllLevelModel(
      id: json['id'] as int? ?? 0,
      levelName: json['level_name'] as String? ?? 'levelName',
      point: json['point'] as String? ?? 'point',
      amount: json['amount'] as String? ?? 'amount',
      remark: json['remark'] as String? ?? 'remark',
      createdAt: json['created_at'] as String? ?? 'createdAt',
      updatedAt: json['updated_at'] as String? ?? 'updatedAt',
    );

Map<String, dynamic> _$AllLevelModelToJson(AllLevelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'level_name': instance.levelName,
      'point': instance.point,
      'amount': instance.amount,
      'remark': instance.remark,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
