// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_exchange_rate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillExchangeRateModel _$BillExchangeRateModelFromJson(
        Map<String, dynamic> json) =>
    BillExchangeRateModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'name',
      coin: json['coin'] as int? ?? 0,
      image: json['img_url'] as String? ?? 'image',
    );

Map<String, dynamic> _$BillExchangeRateModelToJson(
        BillExchangeRateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coin': instance.coin,
      'img_url': instance.image,
    };
