// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allinvestor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllInvestorModel _$AllInvestorModelFromJson(Map<String, dynamic> json) =>
    AllInvestorModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'name',
      email: json['email'] as String? ?? 'email',
      emailVerifiedAt:
          json['email_verified_at'] as String? ?? 'emailVerifiedAt',
      phone: json['phone'] as String? ?? 'phone',
      img: json['img'] as String? ?? 'img',
      address: json['address'] as String? ?? 'address',
      remark: json['remark'] as String? ?? 'remark',
      referCode: json['refer_code'] as String? ?? 'referCode',
      createdAt: json['created_at'] as String? ?? 'createdAt',
      updatedAt: json['updated_at'] as String? ?? 'updatedAt',
    );

Map<String, dynamic> _$AllInvestorModelToJson(AllInvestorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'phone': instance.phone,
      'img': instance.img,
      'address': instance.address,
      'refer_code': instance.referCode,
      'remark': instance.remark,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
