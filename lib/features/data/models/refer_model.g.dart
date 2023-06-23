// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReferModel _$ReferModelFromJson(Map<String, dynamic> json) => ReferModel(
      id: json['id'] as int? ?? 0,
      originalInvester:
          json['original_invester'] as String? ?? 'originalInvester',
      referInvester: json['refer_invester'] as String? ?? 'referInvester',
      referCode: json['refer_code'] as String? ?? 'referCode',
      first: json['first'] as String? ?? 'first',
      second: json['second'] as String? ?? 'second',
      third: json['third'] as String? ?? 'third',
      createdAt: json['created_at'] as String? ?? 'createdAt',
      updatedAt: json['updated_at'] as String? ?? 'updatedAt',
    );

Map<String, dynamic> _$ReferModelToJson(ReferModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'original_invester': instance.originalInvester,
      'refer_invester': instance.referInvester,
      'refer_code': instance.referCode,
      'first': instance.first,
      'second': instance.second,
      'third': instance.third,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
