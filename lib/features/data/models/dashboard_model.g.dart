// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) =>
    DashboardModel(
      deposit_amount: (json['deposit_amount'] as num?)?.toDouble() ?? 0,
      total_points: (json['total_points'] as num?)?.toDouble() ?? 0,
      referral_investers: (json['referral_investers'] as num?)?.toDouble() ?? 0,
      referral_balance: (json['referral_balance'] as num?)?.toDouble() ?? 0,
      deposit_profit_balance:
          (json['deposit_profit_balance'] as num?)?.toDouble() ?? 0,
      withdraw_balance: (json['withdraw_balance'] as num?)?.toDouble() ?? 0,
      total_net_profit: (json['total_net_profit'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$DashboardModelToJson(DashboardModel instance) =>
    <String, dynamic>{
      'deposit_amount': instance.deposit_amount,
      'total_points': instance.total_points,
      'referral_investers': instance.referral_investers,
      'referral_balance': instance.referral_balance,
      'deposit_profit_balance': instance.deposit_profit_balance,
      'withdraw_balance': instance.withdraw_balance,
      'total_net_profit': instance.total_net_profit,
    };
