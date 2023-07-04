// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      username: json['username'] as String? ?? '',
      email: json['email'] as String? ?? '',
      userlevel: json['userlevel'] as String? ?? '',
      total_deposit_amount:
          (json['total_deposit_amount'] as num?)?.toDouble() ?? 0,
      wallet_address: json['wallet_address'] as String? ?? '',
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'userlevel': instance.userlevel,
      'total_deposit_amount': instance.total_deposit_amount,
      'wallet_address': instance.wallet_address,
    };
