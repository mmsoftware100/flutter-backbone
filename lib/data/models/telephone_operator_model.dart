import 'package:json_annotation/json_annotation.dart';
import 'package:myan_quiz/domain/entities/telephone_operator.dart';

import '../../domain/entities/category.dart';
import '../../domain/entities/user.dart';


part 'telephone_operator_model.g.dart';
@JsonSerializable(explicitToJson: true)
class TelephoneOperatorModel{

  @JsonKey(defaultValue: 0)
  int id;

  @JsonKey(name: 'name' ,defaultValue: "name")
  String name;

  @JsonKey(name: 'img_url' ,defaultValue: "image")
  String image;
  TelephoneOperatorModel({
    required this.id,
    required this.name,
    required this.image
  });

  factory TelephoneOperatorModel.fromJson(Map<String, dynamic> json) {
    return _$TelephoneOperatorModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$TelephoneOperatorModelToJson(this);

  TelephoneOperator toEntity(){
    return TelephoneOperator(id: id, name: name, image: image);
  }
}


