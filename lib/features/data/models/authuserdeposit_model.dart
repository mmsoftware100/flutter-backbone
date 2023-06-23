




import 'package:base/features/domain/entities/authuserdeposit.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/agent.dart';
import '../../domain/entities/deposit.dart';


part 'authuserdeposit_model.g.dart';
@JsonSerializable(explicitToJson: true)


class AuthUserDepositModel {

  @JsonKey(name: 'id', defaultValue: 0)
  int id;

  @JsonKey(name: 'invester_id', defaultValue: "investerId")
  String investerId;

  @JsonKey(name: 'create_user', defaultValue: "createUser")
  String createUser;

  @JsonKey(name: 'model', defaultValue: "model")
  String model;

  @JsonKey(name: 'deposit_amount', defaultValue: "depositAmount")
  String depositAmount;

  @JsonKey(name: 'level_id', defaultValue: "levelId")
  String levelId;

  @JsonKey(name: 'point', defaultValue: "point")
  String point;

  @JsonKey(name: 'remark', defaultValue: "remark")
  String remark;

  @JsonKey(name: 'created_at', defaultValue: "createdAt")
  String createdAt;

  @JsonKey(name: 'updated_at', defaultValue: "updatedAt")
  String updatedAt;

  AuthUserDepositModel({
    required this.id,
    required this.investerId,
    required this.createUser,
    required this.model,
    required this.depositAmount,
    required this.levelId,
    required this.point,
    required this.remark,
    required this.createdAt,
    required this.updatedAt
  });

  AuthUserDeposit toEntity(){
    return AuthUserDeposit(
        id: id,
        remark: remark,
        createdAt: createdAt,
        updatedAt: updatedAt,
        investerId: investerId,
        createUser: createUser,
        model: model,
        depositAmount: depositAmount,
        levelId: levelId,
        point: point
    );
  }


  static AuthUserDepositModel fromEntity(AuthUserDeposit admin){
    return AuthUserDepositModel(
      id: admin.id,
      remark: admin.remark,
      createdAt: admin.createdAt,
      updatedAt: admin.updatedAt,
      investerId: admin.investerId,
      createUser: admin.createUser,
      model: admin.model,
      depositAmount: admin.depositAmount,
      levelId: admin.levelId,
      point: admin.point,
    );
  }


  factory AuthUserDepositModel.fromJson(Map<String, dynamic> json) =>  _$AuthUserDepositModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthUserDepositModelToJson(this);

}