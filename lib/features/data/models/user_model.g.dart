// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      username: json['username'] as String? ?? 'username',
      email: json['email'] as String? ?? 'email',
      phone: json['phone'] as String? ?? 'phone',
      profile_picture: json['profile_picture'] as String? ?? 'profile_picture',
      address: json['address'] as String? ?? 'address',
      remark: json['remark'] as String? ?? 'remark',
      password: json['password'] as String? ?? 'password',
      level: json['level'] as String? ?? 'level',
      accessToken: json['accessToken'] as String? ?? 'accessToken',
      wallet_address: json['wallet_address'] as String? ?? 'wallet_address',
      deposit_address: json['deposit_address'] as String? ?? 'deposit_address',
      referCode: json['refer_code'] as String? ?? 'referCode',
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'profile_picture': instance.profile_picture,
      'address': instance.address,
      'remark': instance.remark,
      'password': instance.password,
      'level': instance.level,
      'accessToken': instance.accessToken,
      'wallet_address': instance.wallet_address,
      'deposit_address': instance.deposit_address,
      'referral_code': instance.referCode,
    };
