// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_exchange_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillExchangeStatusModel _$BillExchangeStatusModelFromJson(
        Map<String, dynamic> json) =>
    BillExchangeStatusModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'name',
      image: json['img_url'] as String? ?? 'image',
    );

Map<String, dynamic> _$BillExchangeStatusModelToJson(
        BillExchangeStatusModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'img_url': instance.image,
    };
