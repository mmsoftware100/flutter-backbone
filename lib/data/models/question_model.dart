import 'package:json_annotation/json_annotation.dart';
import 'package:myan_quiz/domain/entities/description.dart';
import 'package:myan_quiz/domain/entities/question.dart';

import '../../domain/entities/answer.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/user.dart';
import 'answer_model.dart';
import 'description_model.dart';


part 'question_model.g.dart';
@JsonSerializable(explicitToJson: true)
class QuestionModel{

  @JsonKey(defaultValue: 0)
  int id;

  @JsonKey(name: 'name' ,defaultValue: "name")
  String name;

  @JsonKey(name: 'img_url' ,defaultValue: "image")
  String image;


  @JsonKey(name: 'answers' ,defaultValue: [])
  List<AnswerModel> answers;

  @JsonKey(name: 'description' ,defaultValue: null)
  DescriptionModel? description;


  @JsonKey(name: 'correct_answer' ,defaultValue: null)
  AnswerModel correctAnswer;


  QuestionModel({
    required this.id,
    required this.name,
    required this.image,
    required this.answers,
    required this.description,
    required this.correctAnswer
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return _$QuestionModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);

  Question toEntity(){
    return Question(
        id: id,
        name: name,
        image: image,
        answers: answers.map((e) => e.toEntity()).toList(),
        description: description?.toEntity() ?? Description.sample,
        correctAnswer: correctAnswer?.toEntity() ?? Answer.sample
    );
  }
}


