

import 'package:base/features/data/models/admin_model.dart';
import 'package:base/features/data/models/agent_model.dart';
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
import 'package:base/features/domain/entities/refer.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/agent.dart';
import '../../domain/entities/authuserpayment.dart';
import '../../domain/entities/deposit.dart';
import '../../domain/entities/investordeposit.dart';
import '../../domain/entities/level.dart';
import 'level_model.dart';


part 'investordeposit_model.g.dart';
@JsonSerializable(explicitToJson: true)


class InvestorDepositModel {

  @JsonKey(name: 'deposit', defaultValue: [])
  List<DepositModel> deposit;

  @JsonKey(name: 'level', defaultValue: [])
  List<LevelModel> level;

  @JsonKey(name: 'admin', defaultValue: [])
  List<AdminModel> admin;

  @JsonKey(name: 'agent', defaultValue: [])
  List<AgentModel> agent;

  @JsonKey(name: 'invester', defaultValue: [])
  List<InvestorModel> invester;

  @JsonKey(name: 'status', defaultValue: '')
  String status;

  InvestorDepositModel({
    required this.deposit,
    required this.level,
    required this.admin,
    required this.agent,
    required this.invester,
    required this.status
  });

  InvestorDeposit toEntity(){
    return InvestorDeposit(
        deposit: deposit.map((e) => e.toEntity()).toList(),
        level: level.map((e) => e.toEntity()).toList(),
        admin: admin.map((e) => e.toEntity()).toList(),
        agent: agent.map((e) => e.toEntity()).toList(),
        invester: invester.map((e) => e.toEntity()).toList(),
        status:status
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


  factory InvestorDepositModel.fromJson(Map<String, dynamic> json) =>  _$InvestorDepositModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvestorDepositModelToJson(this);

}