
import 'package:base/features/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/admin.dart';


part 'admin_model.g.dart';
@JsonSerializable(explicitToJson: true)
class AdminModel {

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

  @JsonKey(name: 'created_at', defaultValue: "createdAt")
  String createdAt;

  @JsonKey(name: 'updated_at', defaultValue: "updatedAt")
  String updatedAt;

  AdminModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.img,
    required this.address,
    required this.remark,
    required this.createdAt,
    required this.updatedAt,
    required this.emailVerifiedAt
  });

  Admin toEntity(){
    return Admin(
        id: id,
        name: name,
        email: email,
        phone: phone,
        img: img,
        address: address,
        remark: remark,
        createdAt: createdAt,
        emailVerifiedAt: emailVerifiedAt,
        updatedAt: updatedAt
    );
  }


  static AdminModel fromEntity(Admin admin){
    return AdminModel(
        id: admin.id,
        name: admin.name,
        email: admin.email,
        phone: admin.phone,
        img: admin.img,
        address: admin.address,
        remark: admin.remark,
        createdAt: admin.createdAt,
        updatedAt: admin.updatedAt,
        emailVerifiedAt: admin.emailVerifiedAt,
    );
  }


  factory AdminModel.fromJson(Map<String, dynamic> json) =>  _$AdminModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdminModelToJson(this);

}