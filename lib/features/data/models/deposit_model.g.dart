// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositModel _$DepositModelFromJson(Map<String, dynamic> json) => DepositModel(
      id: json['id'] as int? ?? 0,
      investerId: json['invester_id'] as String? ?? 'investerId',
      createUser: json['create_user'] as String? ?? 'createUser',
      model: json['model'] as String? ?? 'model',
      depositAmount: json['deposit_amount'] as String? ?? 'depositAmount',
      levelId: json['level_id'] as String? ?? 'levelId',
      point: json['point'] as String? ?? 'point',
      remark: json['remark'] as String? ?? 'remark',
      createdAt: json['created_at'] as String? ?? 'createdAt',
      updatedAt: json['updated_at'] as String? ?? 'updatedAt',
    );

Map<String, dynamic> _$DepositModelToJson(DepositModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invester_id': instance.investerId,
      'create_user': instance.createUser,
      'model': instance.model,
      'deposit_amount': instance.depositAmount,
      'level_id': instance.levelId,
      'point': instance.point,
      'remark': instance.remark,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
