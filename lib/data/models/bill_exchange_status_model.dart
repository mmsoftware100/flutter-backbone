import 'package:json_annotation/json_annotation.dart';
import 'package:myan_quiz/domain/entities/bill_exchange_status.dart';
import 'package:myan_quiz/domain/entities/telephone_operator.dart';

import '../../domain/entities/category.dart';
import '../../domain/entities/user.dart';


part 'bill_exchange_status_model.g.dart';
@JsonSerializable(explicitToJson: true)
class BillExchangeStatusModel{

  @JsonKey(defaultValue: 0)
  int id;

  @JsonKey(name: 'name' ,defaultValue: "name")
  String name;

  @JsonKey(name: 'img_url' ,defaultValue: "image")
  String image;
  BillExchangeStatusModel({
    required this.id,
    required this.name,
    required this.image
  });

  factory BillExchangeStatusModel.fromJson(Map<String, dynamic> json) {
    return _$BillExchangeStatusModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$BillExchangeStatusModelToJson(this);

  BillExchangeStatus toEntity(){
    return BillExchangeStatus(id: id, name: name, image: image);
  }
}


