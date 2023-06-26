// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvestorModel _$InvestorModelFromJson(Map<String, dynamic> json) =>
    InvestorModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      emailVerifiedAt: json['email_verified_at'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      img: json['img'] as String? ?? '',
      address: json['address'] as String? ?? '',
      remark: json['remark'] as String? ?? '',
      referCode: json['refer_code'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
    );

Map<String, dynamic> _$InvestorModelToJson(InvestorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'phone': instance.phone,
      'img': instance.img,
      'address': instance.address,
      'remark': instance.remark,
      'refer_code': instance.referCode,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
