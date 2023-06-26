// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investordashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvestorDashboardModel _$InvestorDashboardModelFromJson(
        Map<String, dynamic> json) =>
    InvestorDashboardModel(
      authId: json['authId'] as int? ?? 0,
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
      deposit: (json['deposit'] as List<dynamic>?)
              ?.map((e) => DepositModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      level: (json['level'] as List<dynamic>?)
              ?.map((e) => LevelModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      todayDate: json['todayDate'] as String? ?? 'todayDate',
      depositProfit: json['deposit_profit'] as int? ?? 0,
      payment: json['payment'] as String? ?? 'payment',
      sixmonth: json['sixmonth'] as String? ?? 'sixmonth',
      withdrawAmount: json['withdraw_amount'] as int? ?? 0,
      threeMonthFivepercentIncreaseDate:
          json['three_month_fivepercent_increase_date'] as String? ??
              'threeMonthFivepercentIncreaseDate',
      sixMonthTenpercentIncreaseDate:
          json['six_month_tenpercent_increase_date'] as String? ??
              'sixMonthTenpercentIncreaseDate',
      nineMonthFifteenpercentIncreaseDate:
          json['nine_month_fifteenpercent_increase_date'] as String? ??
              'nineMonthFifteenpercentIncreaseDate',
      twelveMonthIncreaseDate: json['twelve_month_increase_date'] as String? ??
          'twelveMonthIncreaseDate',
      authUser: json['auth_user'] == null
          ? null
          : AuthUserModel.fromJson(json['auth_user'] as Map<String, dynamic>),
      authUserImage: json['auth_user_image'] as String? ?? 'authUserImage',
      authUserDeposit: (json['auth_user_deposit'] as List<dynamic>?)
              ?.map((e) =>
                  AuthUserDepositModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      authUserPayment: json['auth_user_payment'] == null
          ? null
          : AuthUserPaymentModel.fromJson(
              json['auth_user_payment'] as Map<String, dynamic>),
      totalReferProfitAmount: json['total_refer_profit_amount'] as int? ?? 0,
      totalDepositProfitAmount:
          json['total_deposit_profit_amount'] as int? ?? 0,
      totalDepositAmount: json['total_deposit_amount'] as int? ?? 0,
    );

Map<String, dynamic> _$InvestorDashboardModelToJson(
        InvestorDashboardModel instance) =>
    <String, dynamic>{
      'authId': instance.authId,
      'refer': instance.refer?.toJson(),
      'refer_first_array': instance.referFirstArray,
      'refer_second_array': instance.referSecondArray,
      'refer_third_array': instance.referThirdArray,
      'deposit': instance.deposit.map((e) => e.toJson()).toList(),
      'level': instance.level.map((e) => e.toJson()).toList(),
      'todayDate': instance.todayDate,
      'deposit_profit': instance.depositProfit,
      'payment': instance.payment,
      'sixmonth': instance.sixmonth,
      'withdraw_amount': instance.withdrawAmount,
      'three_month_fivepercent_increase_date':
          instance.threeMonthFivepercentIncreaseDate,
      'six_month_tenpercent_increase_date':
          instance.sixMonthTenpercentIncreaseDate,
      'nine_month_fifteenpercent_increase_date':
          instance.nineMonthFifteenpercentIncreaseDate,
      'twelve_month_increase_date': instance.twelveMonthIncreaseDate,
      'auth_user': instance.authUser?.toJson(),
      'auth_user_image': instance.authUserImage,
      'auth_user_deposit':
          instance.authUserDeposit.map((e) => e.toJson()).toList(),
      'auth_user_payment': instance.authUserPayment?.toJson(),
      'total_refer_profit_amount': instance.totalReferProfitAmount,
      'total_deposit_profit_amount': instance.totalDepositProfitAmount,
      'total_deposit_amount': instance.totalDepositAmount,
    };
