

import 'package:base/features/domain/entities/authuserdeposit.dart';
import 'package:base/features/domain/entities/dashboard.dart';
import 'package:base/features/domain/entities/deposit_address.dart';
import 'package:base/features/domain/entities/deposit_transaction.dart';
import 'package:base/features/domain/entities/refer.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:base/features/domain/entities/withdraw_transaction.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/agent.dart';
import '../../domain/entities/authuserpayment.dart';
import '../../domain/entities/deposit.dart';


part 'withdrawtransaction_model.g.dart';
@JsonSerializable(explicitToJson: true)


class WithdrawTransactionModel {

  @JsonKey(name: 'investor', defaultValue: "investor")
  String investor;

  @JsonKey(name: 'withdraw_provider', defaultValue: "withdraw_provider")
  String withdraw_provider;

  @JsonKey(name: 'withdraw_amount', defaultValue: 0)
  double withdraw_amount;

  @JsonKey(name: 'topup_date', defaultValue: "2023-07-04")
  String withdraw_date;

  @JsonKey(name: 'remark', defaultValue: "remark")
  String remark;

  @JsonKey(name: 'status', defaultValue: "status")
  String status;

  WithdrawTransactionModel({
    required this.investor,
    required this.withdraw_provider,
    required this.withdraw_amount,
    required this.withdraw_date,
    required this.remark,
    required this.status
  });

  WithdrawTransaction toEntity(){
    return WithdrawTransaction(investor: investor, withdraw_provider: withdraw_provider, withdraw_amount: withdraw_amount, withdraw_date: withdraw_date, remark: remark, status: status);
  }


  static WithdrawTransactionModel fromEntity(WithdrawTransaction withdrawTransaction){
    return WithdrawTransactionModel(investor: withdrawTransaction.investor, withdraw_provider: withdrawTransaction.withdraw_provider, withdraw_amount: withdrawTransaction.withdraw_amount, withdraw_date: withdrawTransaction.withdraw_date, remark: withdrawTransaction.remark, status: withdrawTransaction.status);
  }


  factory WithdrawTransactionModel.fromJson(Map<String, dynamic> json) =>  _$WithdrawTransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawTransactionModelToJson(this);

}