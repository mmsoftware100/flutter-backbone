// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'name',
      email: json['email'] as String? ?? 'email',
      phoneNo: json['phone_no'] as String? ?? 'phoneNo',
      accessToken: json['access_token'] as String? ?? 'accessToken',
      createdAt: json['created_at'] as String? ?? 'createdAt',
      modifiedAt: json['modifiedAt'] as String? ?? 'modifiedAt',
      dev: json['dev'] as bool? ?? true,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone_no': instance.phoneNo,
      'access_token': instance.accessToken,
      'created_at': instance.createdAt,
      'modifiedAt': instance.modifiedAt,
      'dev': instance.dev,
    };
