import 'package:base/features/domain/entities/level.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/agent.dart';
import '../../domain/entities/withdraw.dart';


part 'withdraw_model.g.dart';
@JsonSerializable(explicitToJson: true)



class WithdrawModel {

  @JsonKey(name: 'id', defaultValue: 0)
  int id;

  @JsonKey(name: 'invester_id', defaultValue: "investerId")
  String investerId;

  @JsonKey(name: 'payment_account', defaultValue: "paymentAccount")
  String paymentAccount;

  @JsonKey(name: 'withdraw_amount', defaultValue: "withdrawAmount")
  String withdrawAmount;

  @JsonKey(name: 'refer_profit_amount', defaultValue: "referProfitAmount")
  String referProfitAmount;

  @JsonKey(name: 'deposit_profit_amount', defaultValue: "depositProfitAmount")
  String depositProfitAmount;

  @JsonKey(name: 'totaldeposit_amount', defaultValue: "totaldepositAmount")
  String totaldepositAmount;

  @JsonKey(name: 'status', defaultValue: "status")
  String status;

  @JsonKey(name: 'provider_id', defaultValue: "providerId")
  String providerId;

  @JsonKey(name: 'user_model', defaultValue: "userModel")
  String userModel;

  @JsonKey(name: 'remark', defaultValue: "remark")
  String remark;

  @JsonKey(name: 'created_at', defaultValue: "createdAt")
  String createdAt;

  @JsonKey(name: 'updated_at', defaultValue: "updatedAt")
  String updatedAt;

  WithdrawModel({
    required this.id,
    required this.investerId,
    required this.paymentAccount,
    required this.withdrawAmount,
    required this.referProfitAmount,
    required this.depositProfitAmount,
    required this.totaldepositAmount,
    required this.status,
    required this.providerId,
    required this.userModel,
    required this.remark,
    required this.createdAt,
    required this.updatedAt
  });

  Withdraw toEntity(){
    return Withdraw(
        id: id,
        remark: remark,
        createdAt: createdAt,
        updatedAt: updatedAt,
        investerId: investerId,
      paymentAccount: paymentAccount,
      withdrawAmount: withdrawAmount,
      referProfitAmount: referProfitAmount,
      depositProfitAmount: depositProfitAmount,
      totaldepositAmount: totaldepositAmount,
      status: status,
      providerId: providerId,
      userModel: userModel
    );
  }


  static WithdrawModel fromEntity(Withdraw admin){
    return WithdrawModel(
        id: admin.id,
        remark: admin.remark,
        createdAt: admin.createdAt,
        updatedAt: admin.updatedAt,
        investerId: admin.investerId,
        paymentAccount: admin.paymentAccount,
        withdrawAmount: admin.withdrawAmount,
        referProfitAmount: admin.referProfitAmount,
        depositProfitAmount: admin.depositProfitAmount,
        totaldepositAmount: admin.totaldepositAmount,
        status: admin.status,
        providerId: admin.providerId,
        userModel: admin.userModel
    );
  }


  factory WithdrawModel.fromJson(Map<String, dynamic> json) =>  _$WithdrawModelFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawModelToJson(this);

}