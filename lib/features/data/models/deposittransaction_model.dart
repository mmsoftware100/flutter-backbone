

import 'package:base/features/domain/entities/authuserdeposit.dart';
import 'package:base/features/domain/entities/dashboard.dart';
import 'package:base/features/domain/entities/deposit_address.dart';
import 'package:base/features/domain/entities/deposit_transaction.dart';
import 'package:base/features/domain/entities/refer.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/agent.dart';
import '../../domain/entities/authuserpayment.dart';
import '../../domain/entities/deposit.dart';


part 'deposittransaction_model.g.dart';
@JsonSerializable(explicitToJson: true)


class DepositTransactionModel {

  @JsonKey(name: 'investor', defaultValue: "investor")
  String investor;

  @JsonKey(name: 'topup_provider', defaultValue: "topup_provider")
  String topup_provider;

  @JsonKey(name: 'deposit_amount', defaultValue: 0)
  double deposit_amount;

  @JsonKey(name: 'point', defaultValue: 0)
  double point;

  @JsonKey(name: 'topup_date', defaultValue: "2023-07-04")
  String topup_date;

  @JsonKey(name: 'remark', defaultValue: "remark")
  String remark;

  @JsonKey(name: 'status', defaultValue: "status")
  String status;

  DepositTransactionModel({
    required this.investor,
    required this.topup_provider,
    required this.deposit_amount,
    required this.point,
    required this.topup_date,
    required this.remark,
    required this.status
  });

  DepositTransaction toEntity(){
    return DepositTransaction(investor: investor, topup_provider: topup_provider, deposit_amount: deposit_amount, point: point, topup_date: topup_date, remark: remark, status: status);
  }


  static DepositTransactionModel fromEntity(DepositTransaction depositTransaction){
    return DepositTransactionModel(investor: depositTransaction.investor, topup_provider: depositTransaction.topup_provider, deposit_amount: depositTransaction.deposit_amount, point: depositTransaction.point, topup_date: depositTransaction.topup_date, remark: depositTransaction.remark, status: depositTransaction.status);
  }


  factory DepositTransactionModel.fromJson(Map<String, dynamic> json) =>  _$DepositTransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$DepositTransactionModelToJson(this);

}