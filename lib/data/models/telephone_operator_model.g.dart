// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telephone_operator_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TelephoneOperatorModel _$TelephoneOperatorModelFromJson(
        Map<String, dynamic> json) =>
    TelephoneOperatorModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'name',
      image: json['img_url'] as String? ?? 'image',
    );

Map<String, dynamic> _$TelephoneOperatorModelToJson(
        TelephoneOperatorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'img_url': instance.image,
    };
