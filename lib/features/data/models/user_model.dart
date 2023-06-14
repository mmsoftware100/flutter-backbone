
import 'package:base/features/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';


part 'user_model.g.dart';
@JsonSerializable(explicitToJson: true)
class UserModel {

  @JsonKey(name: 'id', defaultValue: 0)
  int id;

  @JsonKey(name: 'name', defaultValue: "name")
  String name;

  @JsonKey(name: 'email', defaultValue: "email")
  String email;

  @JsonKey(name: 'password', defaultValue: "password")
  String password;

  @JsonKey(name: 'refer_code', defaultValue: "refer_code")
  String referCode;

  @JsonKey(name: 'phone', defaultValue: "phone")
  String phone;

  @JsonKey(name: 'img', defaultValue: "img")
  String img;

  @JsonKey(name: 'address', defaultValue: "address")
  String address;

  @JsonKey(name: 'remark', defaultValue: "remark")
  String remark;

  @JsonKey(name: 'access_token', defaultValue: "accessToken")
  String accessToken;

  @JsonKey(name: 'created_at', defaultValue: "createdAt")
  String createdAt;

  @JsonKey(name: 'modifiedAt', defaultValue: "modifiedAt")
  String modifiedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.referCode,
    required this.phone,
    required this.img,
    required this.address,
    required this.remark,
    required this.accessToken,
    required this.createdAt,
    required this.modifiedAt
  });

  User toEntity(){
    return User(
        id: id,
        name: name,
        email: email,
        password: password,
        referCode: referCode,
        phone: phone,
        img: img,
        address: address,
        remark: remark,
        accessToken: accessToken,
        createdAt: createdAt,
        modifiedAt: modifiedAt
    );
  }


  static UserModel fromEntity(User user){
    return UserModel(
        id: user.id,
        name: user.name,
        email: user.email,
        password: user.password,
        referCode: user.referCode,
        phone: user.phone,
        img: user.img,
        address: user.address,
        remark: user.remark,
        accessToken: user.accessToken,
        createdAt: user.createdAt,
        modifiedAt: user.modifiedAt
    );
  }


  factory UserModel.fromJson(Map<String, dynamic> json) =>  _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

}