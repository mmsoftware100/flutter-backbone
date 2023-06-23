import 'package:base/features/domain/entities/authuserdeposit.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/agent.dart';
import '../../domain/entities/authuserpayment.dart';
import '../../domain/entities/deposit.dart';


part 'authuserpayment_model.g.dart';
@JsonSerializable(explicitToJson: true)


class AuthUserPaymentModel {

  @JsonKey(name: 'id', defaultValue: 0)
  int id;

  @JsonKey(name: 'invester_id', defaultValue: "investerId")
  String investerId;

  @JsonKey(name: 'payment_account', defaultValue: "paymentAccount")
  String paymentAccount;

  @JsonKey(name: 'created_at', defaultValue: "createdAt")
  String createdAt;

  @JsonKey(name: 'updated_at', defaultValue: "updatedAt")
  String updatedAt;

  AuthUserPaymentModel({
    required this.id,
    required this.investerId,
    required this.paymentAccount,
    required this.createdAt,
    required this.updatedAt
  });

  AuthUserPayment toEntity(){
    return AuthUserPayment(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        investerId: investerId,
        paymentAccount: paymentAccount
    );
  }


  static AuthUserPaymentModel fromEntity(AuthUserPayment admin){
    return AuthUserPaymentModel(
      id: admin.id,
      createdAt: admin.createdAt,
      updatedAt: admin.updatedAt,
      investerId: admin.investerId,
      paymentAccount: admin.paymentAccount
    );
  }


  factory AuthUserPaymentModel.fromJson(Map<String, dynamic> json) =>  _$AuthUserPaymentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthUserPaymentModelToJson(this);

}