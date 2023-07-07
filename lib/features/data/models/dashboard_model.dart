

import 'package:base/features/domain/entities/authuserdeposit.dart';
import 'package:base/features/domain/entities/dashboard.dart';
import 'package:base/features/domain/entities/refer.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/agent.dart';
import '../../domain/entities/authuserpayment.dart';
import '../../domain/entities/deposit.dart';


part 'dashboard_model.g.dart';
@JsonSerializable(explicitToJson: true)


class DashboardModel {

  @JsonKey(name: 'deposit_amount', defaultValue: 0)
  double deposit_amount;

  @JsonKey(name: 'total_points', defaultValue: 0)
  double total_points;

  @JsonKey(name: 'referral_investers', defaultValue: 0)
  double referral_investers;

  @JsonKey(name: 'referral_balance', defaultValue: 0)
  double referral_balance;

  @JsonKey(name: 'deposit_profit_balance', defaultValue: 0)
  double deposit_profit_balance;

  @JsonKey(name: 'withdraw_balance', defaultValue: 0)
  double withdraw_balance;

  @JsonKey(name: 'total_net_profit', defaultValue: 0)
  double total_net_profit;

  DashboardModel({
    required this.deposit_amount,
    required this.total_points,
    required this.referral_investers,
    required this.referral_balance,
    required this.deposit_profit_balance,
    required this.withdraw_balance,
    required this.total_net_profit
  });

  Dashboard toEntity(){
    return Dashboard(deposit_amount: deposit_amount, total_points: total_points, referral_investers: referral_investers, referral_balance: referral_balance, deposit_profit_balance: deposit_profit_balance, withdraw_balance: withdraw_balance, total_net_profit: total_net_profit);
  }


  static DashboardModel fromEntity(Dashboard dashboard){
    return DashboardModel(deposit_amount: dashboard.deposit_amount, total_points: dashboard.total_points, referral_investers: dashboard.referral_investers, referral_balance: dashboard.referral_balance, deposit_profit_balance: dashboard.deposit_profit_balance, withdraw_balance: dashboard.withdraw_balance, total_net_profit: dashboard.total_net_profit);
  }


  factory DashboardModel.fromJson(Map<String, dynamic> json) =>  _$DashboardModelFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardModelToJson(this);

}