import 'dart:html';

import 'package:base/features/data/models/quote_model.dart';
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/domain/entities/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DataModel {
  @JsonKey(name: 'username', defaultValue: '')
  String username;

  @JsonKey(name: 'email', defaultValue: '')
  String email;

  @JsonKey(name: 'userlevel', defaultValue: '')
  String userlevel;

  @JsonKey(name: 'total_deposit_amount', defaultValue: 0)
  double total_deposit_amount;

  @JsonKey(name: 'wallet_address', defaultValue: '')
  String wallet_address;

  DataModel({
    required this.username,
    required this.email,
    required this.userlevel,
    required this.total_deposit_amount,
    required this.wallet_address
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);

  Data toEntity(){
    //QuoteModel? quoteModel = quote[quote.keys.first];
    return Data(username: username, email: email, userlevel: userlevel, total_deposit_amount: total_deposit_amount, wallet_address: wallet_address
        // id: id,
        // name: name,
        // symbol: symbol,
        // price: quoteModel?.price ?? 0,
        // marketCap: quoteModel?.marketCap ?? 0
    );
  }
}
