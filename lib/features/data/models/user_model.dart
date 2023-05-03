
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

  @JsonKey(name: 'phone_no', defaultValue: "phoneNo")
  String phoneNo;

  @JsonKey(name: 'access_token', defaultValue: "accessToken")
  String accessToken;

  @JsonKey(name: 'created_at', defaultValue: "createdAt")
  String createdAt;

  @JsonKey(name: 'modifiedAt', defaultValue: "modifiedAt")
  String modifiedAt;


  @JsonKey(name: 'dev', defaultValue: true)
  bool dev;


  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.accessToken,
    required this.createdAt,
    required this.modifiedAt,
    required this.dev
  });

  User toEntity(){
    return User(
        id: id,
        name: name,
        email: email,
        phoneNo: phoneNo,
        accessToken: accessToken,
        createdAt: createdAt,
        modifiedAt: modifiedAt,
        dev: dev
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>  _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

}