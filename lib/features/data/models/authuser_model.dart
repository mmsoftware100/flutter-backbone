


import 'package:base/features/domain/entities/authuser.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';




part 'authuser_model.g.dart';
@JsonSerializable(explicitToJson: true)



class AuthUserModel {

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

  @JsonKey(name: 'remark', defaultValue: "remark")
  String remark;

  @JsonKey(name: 'refer_code', defaultValue: "referCode")
  String referCode;

  @JsonKey(name: 'created_at', defaultValue: "createdAt")
  String createdAt;

  @JsonKey(name: 'updated_at', defaultValue: "updatedAt")
  String updatedAt;

  AuthUserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.img,
    required this.address,
    required this.remark,
    required this.referCode,
    required this.createdAt,
    required this.updatedAt,
    required this.emailVerifiedAt
  });

  AuthUser toEntity(){
    return AuthUser(
        id: id,
        name: name,
        email: email,
        phone: phone,
        img: img,
        address: address,
        remark: remark,
        createdAt: createdAt,
        emailVerifiedAt: emailVerifiedAt,
        referCode:  referCode,
        updatedAt: updatedAt
    );
  }


  static AuthUserModel fromEntity(AuthUser admin){
    return AuthUserModel(
      id: admin.id,
      name: admin.name,
      email: admin.email,
      phone: admin.phone,
      img: admin.img,
      address: admin.address,
      remark: admin.remark,
      createdAt: admin.createdAt,
      updatedAt: admin.updatedAt,
      referCode: admin.referCode,
      emailVerifiedAt: admin.emailVerifiedAt,
    );
  }


  factory AuthUserModel.fromJson(Map<String, dynamic> json) =>  _$AuthUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthUserModelToJson(this);

}