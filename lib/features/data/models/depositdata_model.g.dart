// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'depositdata_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositDataModel _$DepositDataModelFromJson(Map<String, dynamic> json) =>
    DepositDataModel(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$DepositDataModelToJson(DepositDataModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
