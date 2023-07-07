

import 'package:base/features/domain/entities/authuserdeposit.dart';
import 'package:base/features/domain/entities/dashboard.dart';
import 'package:base/features/domain/entities/deposit_address.dart';
import 'package:base/features/domain/entities/refer.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/agent.dart';
import '../../domain/entities/authuserpayment.dart';
import '../../domain/entities/deposit.dart';


part 'depositaddress_model.g.dart';
@JsonSerializable(explicitToJson: true)


class DepositAddressModel {

  @JsonKey(name: 'name', defaultValue: "name")
  String name;

  @JsonKey(name: 'address', defaultValue: "address")
  String address;

  DepositAddressModel({
    required this.name,
    required this.address,
  });

  DepositAddress toEntity(){
    return DepositAddress(name: name, address: address);
  }


  static DepositAddressModel fromEntity(DepositAddress depositAddress){
    return DepositAddressModel(name: depositAddress.name, address: depositAddress.address);
  }


  factory DepositAddressModel.fromJson(Map<String, dynamic> json) =>  _$DepositAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$DepositAddressModelToJson(this);

}