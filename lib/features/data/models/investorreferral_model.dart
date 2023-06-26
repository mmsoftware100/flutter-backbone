

import 'package:base/features/data/models/alldeposit_model.dart';
import 'package:base/features/data/models/allinvestor_model.dart';
import 'package:base/features/data/models/alllevel_model.dart';
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
import 'package:base/features/domain/entities/investorreferral.dart';
import 'package:base/features/domain/entities/refer.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/agent.dart';
import '../../domain/entities/authuserpayment.dart';
import '../../domain/entities/deposit.dart';
import '../../domain/entities/level.dart';
import 'level_model.dart';


part 'investorreferral_model.g.dart';
@JsonSerializable(explicitToJson: true)


class InvestorReferralModel {

  @JsonKey(name: 'authId', defaultValue: 0)
  int authId;

  @JsonKey(name: 'auth_refer_code', defaultValue: '')
  String authReferCode;

  @JsonKey(name: 'refer', defaultValue: null)
  ReferModel? refer;

  @JsonKey(name: 'refer_first_array', defaultValue: [])
  List<int> referFirstArray;

  @JsonKey(name: 'refer_second_array', defaultValue: [])
  List<int> referSecondArray;

  @JsonKey(name: 'refer_third_array', defaultValue: [])
  List<int> referThirdArray;

  @JsonKey(name: 'all_invester', defaultValue: [])
  List<AllInvestorModel> allInvester;

  @JsonKey(name: 'all_deposit', defaultValue: [])
  List<AllDepositModel> allDeposit;

  @JsonKey(name: 'all_level', defaultValue: [])
  List<AllLevelModel> allLevel;

  @JsonKey(name: 'todayDate', defaultValue: "todayDate")
  String todayDate;

  @JsonKey(name: 'withdraw_amount', defaultValue: 0)
  int withdrawAmount;

  @JsonKey(name: 'payment_account', defaultValue: "")
  String paymentAccount;

  InvestorReferralModel({
    required this.authId,
    required this.authReferCode,
    required this.refer,
    required this.referFirstArray,
    required this.referSecondArray,
    required this.referThirdArray,
    required this.allInvester,
    required this.allDeposit,
    required this.allLevel,
    required this.todayDate,
    required this.paymentAccount,
    required this.withdrawAmount
  });

  InvestorReferral toEntity(){
    return InvestorReferral(
        authId: authId,
        authReferCode: authReferCode,
        refer: refer?.toEntity() ?? Refer.sample() ,
        referFirstArray: referFirstArray,
        referSecondArray: referSecondArray, referThirdArray: referThirdArray,
        todayDate: todayDate,
        withdrawAmount: withdrawAmount,
        allInvester: allInvester.map((e) => e.toEntity()).toList(),
        allDeposit: allDeposit.map((e) => e.toEntity()).toList(),
        allLevel: allLevel.map((e) => e.toEntity()).toList(), paymentAccount: paymentAccount,
    );
  }


  // static InvestorDashboardModel fromEntity(InvestorDashboard admin){
  //   return InvestorDashboardModel(
  //     authId: admin.authId,
  //     authUser: admin.authUser,
  //     refer: admin.refer, referFirstArray: referFirstArray,
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


  factory InvestorReferralModel.fromJson(Map<String, dynamic> json) =>  _$InvestorReferralModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvestorReferralModelToJson(this);

}