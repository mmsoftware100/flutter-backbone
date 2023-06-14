// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'name',
      email: json['email'] as String? ?? 'email',
      password: json['password'] as String? ?? 'password',
      referCode: json['refer_code'] as String? ?? 'refer_code',
      phone: json['phone'] as String? ?? 'phone',
      img: json['img'] as String? ?? 'img',
      address: json['address'] as String? ?? 'address',
      remark: json['remark'] as String? ?? 'remark',
      accessToken: json['access_token'] as String? ?? 'accessToken',
      createdAt: json['created_at'] as String? ?? 'createdAt',
      modifiedAt: json['modifiedAt'] as String? ?? 'modifiedAt',
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'refer_code': instance.referCode,
      'phone': instance.phone,
      'img': instance.img,
      'address': instance.address,
      'remark': instance.remark,
      'access_token': instance.accessToken,
      'created_at': instance.createdAt,
      'modifiedAt': instance.modifiedAt,
    };
