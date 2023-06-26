

import 'package:base/features/data/models/authuser_model.dart';
import 'package:base/features/data/models/authuserdeposit_model.dart';
import 'package:base/features/data/models/authuserpayment_model.dart';
import 'package:base/features/data/models/deposit_model.dart';
import 'package:base/features/data/models/refer_model.dart';
import 'package:base/features/domain/entities/alldeposit.dart';
import 'package:base/features/domain/entities/authuser.dart';
import 'package:base/features/domain/entities/authuserdeposit.dart';
import 'package:base/features/domain/entities/deposit.dart';
import 'package:base/features/domain/entities/deposit.dart';
import 'package:base/features/domain/entities/investordashboard.dart';
import 'package:base/features/domain/entities/refer.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/agent.dart';
import '../../domain/entities/authuserpayment.dart';
import '../../domain/entities/deposit.dart';
import '../../domain/entities/level.dart';
import 'level_model.dart';


//part 'investordashboard_model.g.dart';
@JsonSerializable(explicitToJson: true)


class InvestorDashboardModel {

  @JsonKey(name: 'authId', defaultValue: 0)
  int authId;

  @JsonKey(name: 'refer', defaultValue: null)
  ReferModel? refer;

  @JsonKey(name: 'refer_first_array', defaultValue: [])
  List<int> referFirstArray;

  @JsonKey(name: 'referSecondArray', defaultValue: [])
  List<int> referSecondArray;

  @JsonKey(name: 'referThirdArray', defaultValue: [])
  List<int> referThirdArray;

  @JsonKey(name: 'deposit', defaultValue: [])
  List<DepositModel> deposit;

  @JsonKey(name: 'level', defaultValue: [])
  List<LevelModel> level;

  @JsonKey(name: 'todayDate', defaultValue: "todayDate")
  String todayDate;

  @JsonKey(name: 'deposit_profit', defaultValue: 0)
  int depositProfit;

  @JsonKey(name: 'payment', defaultValue: "payment")
  String payment;

  @JsonKey(name: 'sixmonth', defaultValue: "sixmonth")
  String sixmonth;

  @JsonKey(name: 'withdraw_amount', defaultValue: 0)
  int withdrawAmount;

  @JsonKey(name: 'three_month_fivepercent_increase_date', defaultValue: "threeMonthFivepercentIncreaseDate")
  String threeMonthFivepercentIncreaseDate;

  @JsonKey(name: 'six_month_tenpercent_increase_date', defaultValue: "sixMonthTenpercentIncreaseDate")
  String sixMonthTenpercentIncreaseDate;

  @JsonKey(name: 'nine_month_fifteenpercent_increase_date', defaultValue: "nineMonthFifteenpercentIncreaseDate")
  String nineMonthFifteenpercentIncreaseDate;

  @JsonKey(name: 'twelve_month_increase_date', defaultValue: "twelveMonthIncreaseDate")
  String twelveMonthIncreaseDate;

  @JsonKey(name: 'auth_user', defaultValue: {})
  AuthUserModel authUser;

  @JsonKey(name: 'auth_user_image', defaultValue: "authUserImage")
  String authUserImage;

  @JsonKey(name: 'auth_user_deposit', defaultValue: [])
  List<AuthUserDepositModel> authUserDeposit;

  @JsonKey(name: 'auth_user_payment', defaultValue: null)
  AuthUserPaymentModel? authUserPayment;

  @JsonKey(name: 'total_refer_profit_amount', defaultValue: 0)
  int totalReferProfitAmount;

  @JsonKey(name: 'total_deposit_profit_amount', defaultValue: 0)
  int totalDepositProfitAmount;

  @JsonKey(name: 'total_deposit_amount', defaultValue: 0)
  int totalDepositAmount;

  InvestorDashboardModel({
    required this.authId,
    required this.refer,
    required this.referFirstArray,
    required this.referSecondArray,
    required this.referThirdArray,
    required this.deposit,
    required this.level,
    required this.todayDate,
    required this.depositProfit,
    required this.payment,
    required this.sixmonth,
    required  this.withdrawAmount,
    required this.threeMonthFivepercentIncreaseDate,
    required this.sixMonthTenpercentIncreaseDate,
    required this.nineMonthFifteenpercentIncreaseDate,
    required this.twelveMonthIncreaseDate,
    required this.authUser,
    required  this.authUserImage,
    required this.authUserDeposit,
    required this.authUserPayment,
    required  this.totalReferProfitAmount,
    required  this.totalDepositProfitAmount,
    required  this.totalDepositAmount
  });

  InvestorDashboard toEntity(){
    return InvestorDashboard(
      authId: authId,
      authUser: authUser.toEntity(),
      refer: refer?.toEntity() ?? Refer.sample() ,
        referFirstArray: referFirstArray,
      referSecondArray: referSecondArray, referThirdArray: referThirdArray,
      deposit: deposit.map((e) => e.toEntity()).toList(),
        level: level.map((e) => e.toEntity()).toList(),
        todayDate: todayDate,
      depositProfit: depositProfit, payment: payment, sixmonth: sixmonth,
      withdrawAmount: withdrawAmount, threeMonthFivepercentIncreaseDate: threeMonthFivepercentIncreaseDate,
      sixMonthTenpercentIncreaseDate: sixMonthTenpercentIncreaseDate, nineMonthFifteenpercentIncreaseDate: nineMonthFifteenpercentIncreaseDate,
      twelveMonthIncreaseDate: twelveMonthIncreaseDate, authUserImage: authUserImage,
      authUserDeposit: [],
        authUserPayment: authUserPayment?.toEntity() ?? AuthUserPayment.sample(),
      totalReferProfitAmount: totalReferProfitAmount,
        totalDepositProfitAmount: totalDepositProfitAmount,
      totalDepositAmount: totalDepositAmount
    );
  }


  // static InvestorDashboardModel fromEntity(InvestorDashboard admin){
  //   return InvestorDashboardModel(
  //     authId: admin.authId,
  //     authUser: admin.authUser.,
  //     refer: refer, referFirstArray: referFirstArray,
  //     referSecondArray: referSecondArray, referThirdArray: referThirdArray,
  //     deposit: [], level: [], todayDate: todayDate,
  //     depositProfit: depositProfit, payment: payment, sixmonth: sixmonth,
  //     withdrawAmount: withdrawAmount, threeMonthFivepercentIncreaseDate: threeMonthFivepercentIncreaseDate,
  //     sixMonthTenpercentIncreaseDate: sixMonthTenpercentIncreaseDate, nineMonthFifteenpercentIncreaseDate: nineMonthFifteenpercentIncreaseDate,
  //     twelveMonthIncreaseDate: twelveMonthIncreaseDate, authUserImage: authUserImage,
  //     authUserDeposit: [], authUserPayment: authUserPayment.toEntity(),
  //     totalReferProfitAmount: totalReferProfitAmount, totalDepositProfitAmount: totalDepositProfitAmount,
  //     totalDepositAmount: totalDepositAmount,
  //   );
  // }


  // factory AllDepositModel.fromJson(Map<String, dynamic> json) =>  _$AllDepositModelFromJson(json);
  //
  // Map<String, dynamic> toJson() => _$AllDepositModelToJson(this);

}