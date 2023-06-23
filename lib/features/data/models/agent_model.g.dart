// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentModel _$AgentModelFromJson(Map<String, dynamic> json) => AgentModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'name',
      email: json['email'] as String? ?? 'email',
      phone: json['phone'] as String? ?? 'phone',
      img: json['img'] as String? ?? 'img',
      address: json['address'] as String? ?? 'address',
      remark: json['remark'] as String? ?? 'remark',
      createdAt: json['created_at'] as String? ?? 'createdAt',
      updatedAt: json['updated_at'] as String? ?? 'updatedAt',
      emailVerifiedAt:
          json['email_verified_at'] as String? ?? 'emailVerifiedAt',
    );

Map<String, dynamic> _$AgentModelToJson(AgentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'phone': instance.phone,
      'img': instance.img,
      'address': instance.address,
      'remark': instance.remark,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
