

import 'package:base/features/domain/entities/alldeposit.dart';
import 'package:base/features/domain/entities/allinvestor.dart';
import 'package:base/features/domain/entities/authuserdeposit.dart';
import 'package:base/features/domain/entities/refer.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/agent.dart';
import '../../domain/entities/authuserpayment.dart';
import '../../domain/entities/deposit.dart';


part 'allinvestor_model.g.dart';
@JsonSerializable(explicitToJson: true)


class AllInvestorModel {

  @JsonKey(name: 'id', defaultValue: 0)
  int id;

  @JsonKey(name: 'name', defaultValue: "name")
  String name;

  @JsonKey(name: 'email', defaultValue: "email")
  String email;

  @JsonKey(name: 'email_verified_at', defaultValue: "emailVerifiedAt")
  String emailVerifiedAt;

  @JsonKey(name: 'phone', defaultValue: "phone")
  String phone;

  @JsonKey(name: 'img', defaultValue: "img")
  String img;

  @JsonKey(name: 'address', defaultValue: "address")
  String address;

  @JsonKey(name: 'refer_code', defaultValue: "referCode")
  String referCode;

  @JsonKey(name: 'remark', defaultValue: "remark")
  String remark;

  @JsonKey(name: 'created_at', defaultValue: "createdAt")
  String createdAt;

  @JsonKey(name: 'updated_at', defaultValue: "updatedAt")
  String updatedAt;

  AllInvestorModel({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.phone,
    required this.img,
    required this.address,
    required this.remark,
    required this.referCode,
    required this.createdAt,
    required  this.updatedAt
  });

  AllInvester toEntity(){
    return AllInvester(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      remark: remark,
      name: name,
      email: email,
      emailVerifiedAt: emailVerifiedAt,
      phone: phone,
      img: img,
      address: address,
      referCode: referCode,
    );
  }


  static AllInvestorModel fromEntity(AllInvester admin){
    return AllInvestorModel(
      id: admin.id,
      createdAt: admin.createdAt,
      updatedAt: admin.updatedAt,
      remark: admin.remark,
      name: admin.name,
      email: admin.email,
      emailVerifiedAt: admin.emailVerifiedAt,
      phone: admin.phone,
      img: admin.img,
      address: admin.address,
      referCode: admin.referCode,
    );
  }


  factory AllInvestorModel.fromJson(Map<String, dynamic> json) =>  _$AllInvestorModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllInvestorModelToJson(this);

}