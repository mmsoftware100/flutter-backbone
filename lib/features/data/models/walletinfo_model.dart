import 'package:base/features/data/models/data_model.dart';
import 'package:base/features/data/models/quote_model.dart';
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/domain/entities/data.dart';
import 'package:base/features/domain/entities/walletinfo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'walletinfo_model.g.dart';

@JsonSerializable(explicitToJson: true)
class WalletInfoModel {
  @JsonKey(name: 'status', defaultValue: false)
  bool status;

  @JsonKey(name: 'message', defaultValue: '')
  String message;

  @JsonKey(name: 'data', defaultValue: null)
  DataModel? datamodel;

  WalletInfoModel({
    required this.status,
    required this.message,
    required this.datamodel
  });

  factory WalletInfoModel.fromJson(Map<String, dynamic> json) => _$WalletInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$WalletInfoModelToJson(this);

  WalletInfo toEntity(){
    return WalletInfo(status: status, message: message, data: datamodel?.toEntity() ?? Data.sample()
    );
  }
}
