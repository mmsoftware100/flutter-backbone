

import 'package:base/features/domain/entities/authuserdeposit.dart';
import 'package:base/features/domain/entities/refer.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/agent.dart';
import '../../domain/entities/authuserpayment.dart';
import '../../domain/entities/deposit.dart';


part 'refer_model.g.dart';
@JsonSerializable(explicitToJson: true)


class ReferModel {

  @JsonKey(name: 'id', defaultValue: 0)
  int id;

  @JsonKey(name: 'original_invester', defaultValue: "originalInvester")
  String originalInvester;

  @JsonKey(name: 'refer_invester', defaultValue: "referInvester")
  String referInvester;

  @JsonKey(name: 'refer_code', defaultValue: "referCode")
  String referCode;

  @JsonKey(name: 'first', defaultValue: "first")
  String first;

  @JsonKey(name: 'second', defaultValue: "second")
  String second;

  @JsonKey(name: 'third', defaultValue: "third")
  String third;

  @JsonKey(name: 'created_at', defaultValue: "createdAt")
  String createdAt;

  @JsonKey(name: 'updated_at', defaultValue: "updatedAt")
  String updatedAt;

  ReferModel({
    required this.id,
    required this.originalInvester,
    required this.referInvester,
    required this.referCode,
    required this.first,
    required this.second,
    required this.third,
    required this.createdAt,
    required this.updatedAt
  });

  Refer toEntity(){
    return Refer(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        originalInvester: originalInvester,
        referInvester: referInvester,
        referCode: referCode,
        first: first,
        second: second,
        third: third,
    );
  }


  static ReferModel fromEntity(Refer admin){
    return ReferModel(
        id: admin.id,
        createdAt: admin.createdAt,
        updatedAt: admin.updatedAt,
        originalInvester: admin.originalInvester,
        referInvester: admin.referInvester,
        referCode: admin.referCode,
        first: admin.first,
        second: admin.second,
        third: admin.third
    );
  }


  factory ReferModel.fromJson(Map<String, dynamic> json) =>  _$ReferModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReferModelToJson(this);

}