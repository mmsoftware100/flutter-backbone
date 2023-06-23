// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawModel _$WithdrawModelFromJson(Map<String, dynamic> json) =>
    WithdrawModel(
      id: json['id'] as int? ?? 0,
      investerId: json['invester_id'] as String? ?? 'investerId',
      paymentAccount: json['payment_account'] as String? ?? 'paymentAccount',
      withdrawAmount: json['withdraw_amount'] as String? ?? 'withdrawAmount',
      referProfitAmount:
          json['refer_profit_amount'] as String? ?? 'referProfitAmount',
      depositProfitAmount:
          json['deposit_profit_amount'] as String? ?? 'depositProfitAmount',
      totaldepositAmount:
          json['totaldeposit_amount'] as String? ?? 'totaldepositAmount',
      status: json['status'] as String? ?? 'status',
      providerId: json['provider_id'] as String? ?? 'providerId',
      userModel: json['user_model'] as String? ?? 'userModel',
      remark: json['remark'] as String? ?? 'remark',
      createdAt: json['created_at'] as String? ?? 'createdAt',
      updatedAt: json['updated_at'] as String? ?? 'updatedAt',
    );

Map<String, dynamic> _$WithdrawModelToJson(WithdrawModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invester_id': instance.investerId,
      'payment_account': instance.paymentAccount,
      'withdraw_amount': instance.withdrawAmount,
      'refer_profit_amount': instance.referProfitAmount,
      'deposit_profit_amount': instance.depositProfitAmount,
      'totaldeposit_amount': instance.totaldepositAmount,
      'status': instance.status,
      'provider_id': instance.providerId,
      'user_model': instance.userModel,
      'remark': instance.remark,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
