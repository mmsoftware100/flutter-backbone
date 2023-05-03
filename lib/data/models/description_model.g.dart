// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'description_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DescriptionModel _$DescriptionModelFromJson(Map<String, dynamic> json) =>
    DescriptionModel(
      id: json['id'] as int? ?? 0,
      answerId: json['answer_id'] as int? ?? 0,
      name: json['description'] as String? ?? 'name',
    );

Map<String, dynamic> _$DescriptionModelToJson(DescriptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'answer_id': instance.answerId,
      'description': instance.name,
    };
