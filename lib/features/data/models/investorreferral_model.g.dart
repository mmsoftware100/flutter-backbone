// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investorreferral_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvestorReferralModel _$InvestorReferralModelFromJson(
        Map<String, dynamic> json) =>
    InvestorReferralModel(
      authId: json['authId'] as int? ?? 0,
      authReferCode: json['auth_refer_code'] as String? ?? '',
      refer: json['refer'] == null
          ? null
          : ReferModel.fromJson(json['refer'] as Map<String, dynamic>),
      referFirstArray: (json['refer_first_array'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          [],
      referSecondArray: (json['refer_second_array'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          [],
      referThirdArray: (json['refer_third_array'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          [],
      allInvester: (json['all_invester'] as List<dynamic>?)
              ?.map((e) => AllInvestorModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      allDeposit: (json['all_deposit'] as List<dynamic>?)
              ?.map((e) => AllDepositModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      allLevel: (json['all_level'] as List<dynamic>?)
              ?.map((e) => AllLevelModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      todayDate: json['todayDate'] as String? ?? 'todayDate',
      paymentAccount: json['payment_account'] as String? ?? '',
      withdrawAmount: json['withdraw_amount'] as int? ?? 0,
    );

Map<String, dynamic> _$InvestorReferralModelToJson(
        InvestorReferralModel instance) =>
    <String, dynamic>{
      'authId': instance.authId,
      'auth_refer_code': instance.authReferCode,
      'refer': instance.refer?.toJson(),
      'refer_first_array': instance.referFirstArray,
      'refer_second_array': instance.referSecondArray,
      'refer_third_array': instance.referThirdArray,
      'all_invester': instance.allInvester.map((e) => e.toJson()).toList(),
      'all_deposit': instance.allDeposit.map((e) => e.toJson()).toList(),
      'all_level': instance.allLevel.map((e) => e.toJson()).toList(),
      'todayDate': instance.todayDate,
      'withdraw_amount': instance.withdrawAmount,
      'payment_account': instance.paymentAccount,
    };
