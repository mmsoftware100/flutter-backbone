// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'depositaddress_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositAddressModel _$DepositAddressModelFromJson(Map<String, dynamic> json) =>
    DepositAddressModel(
      name: json['name'] as String? ?? 'name',
      address: json['address'] as String? ?? 'address',
    );

Map<String, dynamic> _$DepositAddressModelToJson(
        DepositAddressModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
    };
