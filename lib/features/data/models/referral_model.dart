

import 'package:base/features/domain/entities/authuserdeposit.dart';
import 'package:base/features/domain/entities/dashboard.dart';
import 'package:base/features/domain/entities/deposit_address.dart';
import 'package:base/features/domain/entities/deposit_transaction.dart';
import 'package:base/features/domain/entities/refer.dart';
import 'package:base/features/domain/entities/referral.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:base/features/domain/entities/withdraw_transaction.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/agent.dart';
import '../../domain/entities/authuserpayment.dart';
import '../../domain/entities/deposit.dart';


part 'referral_model.g.dart';
@JsonSerializable(explicitToJson: true)


class ReferralModel {

  @JsonKey(name: 'profile', defaultValue: "profile")
  String profile;

  @JsonKey(name: 'name', defaultValue: "name")
  String name;

  @JsonKey(name: 'email', defaultValue: "email")
  String email;

  @JsonKey(name: 'deposit', defaultValue: 0)
  double deposit;

  @JsonKey(name: 'percentage', defaultValue: 0)
  double percentage;

  @JsonKey(name: 'revenue', defaultValue: 0)
  double revenue;

  ReferralModel({
    required this.profile,
    required this.name,
    required this.email,
    required this.deposit,
    required this.percentage,
    required this.revenue
  });

  Referral toEntity(){
    return Referral(profile: profile, name: name, email: email, deposit: deposit, percentage: percentage, revenue: revenue);
  }


  static ReferralModel fromEntity(Referral referral){
      return ReferralModel(profile: referral.profile, name: referral.name, email: referral.email, deposit: referral.deposit, percentage: referral.percentage, revenue: referral.revenue) ;
  }


  factory ReferralModel.fromJson(Map<String, dynamic> json) =>  _$ReferralModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReferralModelToJson(this);

}