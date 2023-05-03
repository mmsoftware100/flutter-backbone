import 'package:json_annotation/json_annotation.dart';
import 'package:myan_quiz/domain/entities/description.dart';

import '../../domain/entities/category.dart';
import '../../domain/entities/user.dart';


part 'description_model.g.dart';
@JsonSerializable(explicitToJson: true)
class DescriptionModel{

  @JsonKey(defaultValue: 0)
  int id;

  @JsonKey(name: 'answer_id' ,defaultValue: 0)
  int answerId;

  @JsonKey(name: 'description' ,defaultValue: "name")
  String name;


  DescriptionModel({
    required this.id,
    required this.answerId,
    required this.name,
  });

  factory DescriptionModel.fromJson(Map<String, dynamic> json) {
    return _$DescriptionModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$DescriptionModelToJson(this);

  Description toEntity(){
    return Description(id: id, answerId: answerId, name: name);
  }
}


