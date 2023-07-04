import 'dart:html';

import 'package:base/features/data/models/quote_model.dart';
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/domain/entities/data.dart';
import 'package:base/features/domain/entities/depositdata.dart';
import 'package:json_annotation/json_annotation.dart';

part 'depositdata_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DepositDataModel {
  @JsonKey(name: 'status', defaultValue: false)
  bool status;

  @JsonKey(name: 'message', defaultValue: '')
  String message;

  DepositDataModel({
    required this.status,
    required this.message,
  });

  factory DepositDataModel.fromJson(Map<String, dynamic> json) => _$DepositDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DepositDataModelToJson(this);

  DepositData toEntity(){
    //QuoteModel? quoteModel = quote[quote.keys.first];
    return DepositData(status: status, message: message
    );
  }
}
