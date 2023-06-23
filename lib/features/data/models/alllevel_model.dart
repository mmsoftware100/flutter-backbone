

import 'package:base/features/domain/entities/alldeposit.dart';
import 'package:base/features/domain/entities/allinvestor.dart';
import 'package:base/features/domain/entities/authuserdeposit.dart';
import 'package:base/features/domain/entities/refer.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/agent.dart';
import '../../domain/entities/alllevel.dart';
import '../../domain/entities/authuserpayment.dart';
import '../../domain/entities/deposit.dart';


part 'alllevel_model.g.dart';
@JsonSerializable(explicitToJson: true)


class AllLevelModel {

  @JsonKey(name: 'id', defaultValue: 0)
  int id;

  @JsonKey(name: 'level_name', defaultValue: "levelName")
  String levelName;

  @JsonKey(name: 'point', defaultValue: "point")
  String point;

  @JsonKey(name: 'amount', defaultValue: "amount")
  String amount;

  @JsonKey(name: 'remark', defaultValue: "remark")
  String remark;

  @JsonKey(name: 'created_at', defaultValue: "createdAt")
  String createdAt;

  @JsonKey(name: 'updated_at', defaultValue: "updatedAt")
  String updatedAt;

  AllLevelModel({
    required this.id,
    required this.levelName,
    required this.point,
    required this.amount,
    required this.remark,
    required this.createdAt,
    required this.updatedAt
  });

  AllLevel toEntity(){
    return AllLevel(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      remark: remark,
      levelName: levelName,
      point: point,
      amount: amount,
    );
  }


  static AllLevelModel fromEntity(AllLevel admin){
    return AllLevelModel(
      id: admin.id,
      createdAt: admin.createdAt,
      updatedAt: admin.updatedAt,
      remark: admin.remark,
      levelName: admin.levelName,
      point: admin.point,
      amount: admin.amount,
    );
  }


  factory AllLevelModel.fromJson(Map<String, dynamic> json) =>  _$AllLevelModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllLevelModelToJson(this);

}