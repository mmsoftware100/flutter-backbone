// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_exchange_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillExchangeModel _$BillExchangeModelFromJson(Map<String, dynamic> json) =>
    BillExchangeModel(
      id: json['id'] as int? ?? 0,
      phoneNo: json['phone_no'] as String? ?? 'phone_no',
      telephoneOperatorId: json['telephone_operator_id'] as int? ?? 0,
      billExchangeRateId: json['bill_exchange_rate_id'] as int? ?? 0,
      billExchangeStatusId: json['bill_exchange_status_id'] as int? ?? 0,
      telephoneOperator: json['telephone_operator'] == null
          ? null
          : TelephoneOperatorModel.fromJson(
              json['telephone_operator'] as Map<String, dynamic>),
      billExchangeRate: json['bill_exchange_rate'] == null
          ? null
          : BillExchangeRateModel.fromJson(
              json['bill_exchange_rate'] as Map<String, dynamic>),
      billExchangeStatus: json['bill_exchange_status'] == null
          ? null
          : BillExchangeStatusModel.fromJson(
              json['bill_exchange_status'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      modifiedAt: json['modified_at'] == null
          ? null
          : DateTime.parse(json['modified_at'] as String),
      createdAgo: json['created_ago'] as String? ?? 'created_ago',
      modifiedAgo: json['modified_ago'] as String? ?? 'modified_ago',
    );

Map<String, dynamic> _$BillExchangeModelToJson(BillExchangeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone_no': instance.phoneNo,
      'telephone_operator_id': instance.telephoneOperatorId,
      'bill_exchange_rate_id': instance.billExchangeRateId,
      'bill_exchange_status_id': instance.billExchangeStatusId,
      'telephone_operator': instance.telephoneOperator?.toJson(),
      'bill_exchange_rate': instance.billExchangeRate?.toJson(),
      'bill_exchange_status': instance.billExchangeStatus?.toJson(),
      'created_at': instance.createdAt?.toIso8601String(),
      'modified_at': instance.modifiedAt?.toIso8601String(),
      'created_ago': instance.createdAgo,
      'modified_ago': instance.modifiedAgo,
    };
