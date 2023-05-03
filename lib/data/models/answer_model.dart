import 'package:json_annotation/json_annotation.dart';
import 'package:myan_quiz/domain/entities/answer.dart';

import '../../domain/entities/category.dart';
import '../../domain/entities/user.dart';


part 'answer_model.g.dart';
@JsonSerializable(explicitToJson: true)
class AnswerModel{

  @JsonKey(defaultValue: 0)
  int id;

  @JsonKey(name: 'description' ,defaultValue: "description")
  String name;


  @JsonKey(name: 'answer_id' ,defaultValue: 0)
  int answerId;

  AnswerModel({
    required this.id,
    required this.name,
    required this.answerId
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return _$AnswerModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$AnswerModelToJson(this);

  Answer toEntity(){
    return Answer(id: id, name: name, answerId: answerId);
  }
}


