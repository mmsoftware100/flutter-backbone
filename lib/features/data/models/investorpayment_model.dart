

import 'package:base/features/data/models/admin_model.dart';
import 'package:base/features/data/models/agent_model.dart';
import 'package:base/features/data/models/allinvestor_model.dart';
import 'package:base/features/data/models/alllevel_model.dart';
import 'package:base/features/data/models/authuser_model.dart';
import 'package:base/features/data/models/authuserdeposit_model.dart';
import 'package:base/features/data/models/authuserpayment_model.dart';
import 'package:base/features/data/models/deposit_model.dart';
import 'package:base/features/data/models/investor_model.dart';
import 'package:base/features/data/models/refer_model.dart';
import 'package:base/features/domain/entities/alldeposit.dart';
import 'package:base/features/domain/entities/authuser.dart';
import 'package:base/features/domain/entities/authuserdeposit.dart';
import 'package:base/features/domain/entities/deposit.dart';
import 'package:base/features/domain/entities/deposit.dart';
import 'package:base/features/domain/entities/investordashboard.dart';
import 'package:base/features/domain/entities/investorpayment.dart';
import 'package:base/features/domain/entities/refer.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/agent.dart';
import '../../domain/entities/authuserpayment.dart';
import '../../domain/entities/deposit.dart';
import '../../domain/entities/investordeposit.dart';
import '../../domain/entities/level.dart';
import 'level_model.dart';


part 'investorpayment_model.g.dart';
@JsonSerializable(explicitToJson: true)


class InvestorPaymentModel {

  @JsonKey(name: 'authId', defaultValue: 0)
  int authId;

  @JsonKey(name: 'authPaymentAccount', defaultValue: '')
  String authPaymentAccount;

  @JsonKey(name: 'all_invester', defaultValue: [])
  List<AllInvestorModel> allInvester;

  @JsonKey(name: 'total_deposit_amount', defaultValue: 0)
  int totalDepositAmount;

  @JsonKey(name: 'total_withdraw_amount', defaultValue: 0)
  int totalWithdrawAmount;

  @JsonKey(name: 'total_refer_profit', defaultValue: 0)
  int totalReferProfit;

  @JsonKey(name: 'total_deposit_profit', defaultValue: 0)
  int totalDepositProfit;

  @JsonKey(name: 'all_level', defaultValue: [])
  List<AllLevelModel> allLevel;

  @JsonKey(name: 'todayDate', defaultValue: '')
  String todayDate;

  InvestorPaymentModel({
    required this.authId,
    required this.authPaymentAccount,
    required this.allInvester,
    required this.totalDepositAmount,
    required this.totalWithdrawAmount,
    required  this.totalReferProfit,
    required this.totalDepositProfit,
    required this.allLevel,
    required this.todayDate
  });

  InvestorPayment toEntity(){
    return InvestorPayment(authId: authId,
        authPaymentAccount: authPaymentAccount,
        allInvester: allInvester.map((e) => e.toEntity()).toList(), totalDepositAmount: totalDepositAmount,
        totalWithdrawAmount: totalWithdrawAmount, totalReferProfit: totalReferProfit,
        totalDepositProfit: totalDepositProfit, allLevel: allLevel.map((e) => e.toEntity()).toList(),
        todayDate: todayDate
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


  factory InvestorPaymentModel.fromJson(Map<String, dynamic> json) =>  _$InvestorPaymentModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvestorPaymentModelToJson(this);

}