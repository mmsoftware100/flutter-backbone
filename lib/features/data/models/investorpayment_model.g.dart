// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investorpayment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvestorPaymentModel _$InvestorPaymentModelFromJson(
        Map<String, dynamic> json) =>
    InvestorPaymentModel(
      authId: json['authId'] as int? ?? 0,
      authPaymentAccount: json['authPaymentAccount'] as String? ?? '',
      allInvester: (json['all_invester'] as List<dynamic>?)
              ?.map((e) => AllInvestorModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      totalDepositAmount: json['total_deposit_amount'] as int? ?? 0,
      totalWithdrawAmount: json['total_withdraw_amount'] as int? ?? 0,
      totalReferProfit: json['total_refer_profit'] as int? ?? 0,
      totalDepositProfit: json['total_deposit_profit'] as int? ?? 0,
      allLevel: (json['all_level'] as List<dynamic>?)
              ?.map((e) => AllLevelModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      todayDate: json['todayDate'] as String? ?? '',
    );

Map<String, dynamic> _$InvestorPaymentModelToJson(
        InvestorPaymentModel instance) =>
    <String, dynamic>{
      'authId': instance.authId,
      'authPaymentAccount': instance.authPaymentAccount,
      'all_invester': instance.allInvester.map((e) => e.toJson()).toList(),
      'total_deposit_amount': instance.totalDepositAmount,
      'total_withdraw_amount': instance.totalWithdrawAmount,
      'total_refer_profit': instance.totalReferProfit,
      'total_deposit_profit': instance.totalDepositProfit,
      'all_level': instance.allLevel.map((e) => e.toJson()).toList(),
      'todayDate': instance.todayDate,
    };
