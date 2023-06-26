import 'package:base/features/data/models/quote_model.dart';
import 'package:base/features/domain/entities/investor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'investor_model.g.dart';

@JsonSerializable(explicitToJson: true)
class InvestorModel {
  @JsonKey(name: 'id', defaultValue: 0)
  int id;

  @JsonKey(name: 'name', defaultValue: '')
  String name;

  @JsonKey(name: 'email', defaultValue: '')
  String email;

  @JsonKey(name: 'email_verified_at', defaultValue: '')
  String emailVerifiedAt;

  @JsonKey(name: 'phone', defaultValue: '')
  String phone;

  @JsonKey(name: 'img', defaultValue: '')
  String img;

  @JsonKey(name: 'address', defaultValue: '')
  String address;

  @JsonKey(name: 'remark', defaultValue: '')
  String remark;

  @JsonKey(name: 'refer_code', defaultValue: '')
  String referCode;

  @JsonKey(name: 'created_at', defaultValue: '')
  String createdAt;

  @JsonKey(name: 'updated_at', defaultValue: '')
  String updatedAt;

  InvestorModel({
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
    required this.updatedAt
  });

  factory InvestorModel.fromJson(Map<String, dynamic> json) => _$InvestorModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvestorModelToJson(this);

  Invester toEntity(){
    return Invester(
        id: id,
        name: name, email: email,
        emailVerifiedAt: emailVerifiedAt,
        phone: phone, img: img,
        address: address, remark: remark,
        referCode: referCode, createdAt: createdAt,
        updatedAt: updatedAt,
    );
  }
}
