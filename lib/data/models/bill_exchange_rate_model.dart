import 'package:json_annotation/json_annotation.dart';
import 'package:myan_quiz/domain/entities/telephone_operator.dart';

import '../../domain/entities/bill_exchange_rate.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/user.dart';


part 'bill_exchange_rate_model.g.dart';
@JsonSerializable(explicitToJson: true)
class BillExchangeRateModel{

  @JsonKey(defaultValue: 0)
  int id;

  @JsonKey(name: 'name' ,defaultValue: "name")
  String name;

  @JsonKey(name: 'coin' ,defaultValue: 0)
  int coin;

  @JsonKey(name: 'img_url' ,defaultValue: "image")
  String image;

  BillExchangeRateModel({
    required this.id,
    required this.name,
    required this.coin,
    required this.image
  });

  factory BillExchangeRateModel.fromJson(Map<String, dynamic> json) {
    return _$BillExchangeRateModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$BillExchangeRateModelToJson(this);

  Bill toEntity(){
    return Bill(id: id, name: name, coin: coin, image: image);
  }
}


