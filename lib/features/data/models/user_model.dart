

import 'package:base/features/domain/entities/authuserdeposit.dart';
import 'package:base/features/domain/entities/refer.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/agent.dart';
import '../../domain/entities/authuserpayment.dart';
import '../../domain/entities/deposit.dart';


part 'user_model.g.dart';
@JsonSerializable(explicitToJson: true)


class UserModel {

  @JsonKey(name: 'username', defaultValue: "username")
  String username;

  @JsonKey(name: 'email', defaultValue: "email")
  String email;

  @JsonKey(name: 'phone', defaultValue: "phone")
  String phone;

  @JsonKey(name: 'profile_picture', defaultValue: "profile_picture")
  String profile_picture;

  @JsonKey(name: 'address', defaultValue: "address")
  String address;

  @JsonKey(name: 'remark', defaultValue: "remark")
  String remark;

  @JsonKey(name: 'password', defaultValue: "password")
  String password;

  @JsonKey(name: 'level', defaultValue: "level")
  String level;

  @JsonKey(name: 'accessToken', defaultValue: "accessToken")
  String accessToken;

  @JsonKey(name: 'wallet_address', defaultValue: "wallet_address")
  String wallet_address;

  @JsonKey(name: 'deposit_address', defaultValue: "deposit_address")
  String deposit_address;

  @JsonKey(name: 'referCode', defaultValue: "referCode")
  String referCode;

  UserModel({
    required this.username,
    required this.email,
    required this.phone,
    required this.profile_picture,
    required this.address,
    required this.remark,
    required this.password,
    required this.level,
    required this.accessToken,
    required this.wallet_address,
    required this.deposit_address,
    required this.referCode,
  });

  User toEntity(){
    return User(username: username, email: email, phone: phone, profile_picture: profile_picture, address: address, remark: remark, password: password, level: level, accessToken: accessToken, wallet_address: wallet_address, deposit_address: deposit_address, referCode: referCode);
  }


  static UserModel fromEntity(User user){
    return  UserModel(username: user.username, email: user.email, phone: user.phone, profile_picture: user.profile_picture, address: user.address, remark: user.remark, password: user.password, level: user.level, accessToken: user.accessToken, wallet_address: user.wallet_address, deposit_address: user.deposit_address, referCode: user.referCode);
  }


  factory UserModel.fromJson(Map<String, dynamic> json) =>  _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

}