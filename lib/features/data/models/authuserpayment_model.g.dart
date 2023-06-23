// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authuserpayment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthUserPaymentModel _$AuthUserPaymentModelFromJson(
        Map<String, dynamic> json) =>
    AuthUserPaymentModel(
      id: json['id'] as int? ?? 0,
      investerId: json['invester_id'] as String? ?? 'investerId',
      paymentAccount: json['payment_account'] as String? ?? 'paymentAccount',
      createdAt: json['created_at'] as String? ?? 'createdAt',
      updatedAt: json['updated_at'] as String? ?? 'updatedAt',
    );

Map<String, dynamic> _$AuthUserPaymentModelToJson(
        AuthUserPaymentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invester_id': instance.investerId,
      'payment_account': instance.paymentAccount,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
