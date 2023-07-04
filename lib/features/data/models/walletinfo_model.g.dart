// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'walletinfo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletInfoModel _$WalletInfoModelFromJson(Map<String, dynamic> json) =>
    WalletInfoModel(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      datamodel: json['data'] == null
          ? null
          : DataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WalletInfoModelToJson(WalletInfoModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.datamodel?.toJson(),
    };
