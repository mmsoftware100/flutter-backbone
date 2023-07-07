// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposittransaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositTransactionModel _$DepositTransactionModelFromJson(
        Map<String, dynamic> json) =>
    DepositTransactionModel(
      investor: json['investor'] as String? ?? 'investor',
      topup_provider: json['topup_provider'] as String? ?? 'topup_provider',
      deposit_amount: (json['deposit_amount'] as num?)?.toDouble() ?? 0,
      point: (json['point'] as num?)?.toDouble() ?? 0,
      topup_date: json['topup_date'] as String? ?? '2023-07-04',
      remark: json['remark'] as String? ?? 'remark',
      status: json['status'] as String? ?? 'status',
    );

Map<String, dynamic> _$DepositTransactionModelToJson(
        DepositTransactionModel instance) =>
    <String, dynamic>{
      'investor': instance.investor,
      'topup_provider': instance.topup_provider,
      'deposit_amount': instance.deposit_amount,
      'point': instance.point,
      'topup_date': instance.topup_date,
      'remark': instance.remark,
      'status': instance.status,
    };
