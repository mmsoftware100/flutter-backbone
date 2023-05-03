// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    QuestionModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'name',
      image: json['img_url'] as String? ?? 'image',
      answers: (json['answers'] as List<dynamic>?)
              ?.map((e) => AnswerModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      description: json['description'] == null
          ? null
          : DescriptionModel.fromJson(
              json['description'] as Map<String, dynamic>),
      correctAnswer:
          AnswerModel.fromJson(json['correct_answer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'img_url': instance.image,
      'answers': instance.answers.map((e) => e.toJson()).toList(),
      'description': instance.description?.toJson(),
      'correct_answer': instance.correctAnswer.toJson(),
    };
