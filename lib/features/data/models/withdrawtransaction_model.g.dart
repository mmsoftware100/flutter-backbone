// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdrawtransaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawTransactionModel _$WithdrawTransactionModelFromJson(
        Map<String, dynamic> json) =>
    WithdrawTransactionModel(
      investor: json['investor'] as String? ?? 'investor',
      withdraw_provider:
          json['withdraw_provider'] as String? ?? 'withdraw_provider',
      withdraw_amount: (json['withdraw_amount'] as num?)?.toDouble() ?? 0,
      withdraw_date: json['topup_date'] as String? ?? '2023-07-04',
      remark: json['remark'] as String? ?? 'remark',
      status: json['status'] as String? ?? 'status',
    );

Map<String, dynamic> _$WithdrawTransactionModelToJson(
        WithdrawTransactionModel instance) =>
    <String, dynamic>{
      'investor': instance.investor,
      'withdraw_provider': instance.withdraw_provider,
      'withdraw_amount': instance.withdraw_amount,
      'topup_date': instance.withdraw_date,
      'remark': instance.remark,
      'status': instance.status,
    };
