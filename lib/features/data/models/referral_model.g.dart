// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReferralModel _$ReferralModelFromJson(Map<String, dynamic> json) =>
    ReferralModel(
      profile: json['profile'] as String? ?? 'profile',
      name: json['name'] as String? ?? 'name',
      email: json['email'] as String? ?? 'email',
      deposit: (json['deposit'] as num?)?.toDouble() ?? 0,
      percentage: (json['percentage'] as num?)?.toDouble() ?? 0,
      revenue: (json['revenue'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$ReferralModelToJson(ReferralModel instance) =>
    <String, dynamic>{
      'profile': instance.profile,
      'name': instance.name,
      'email': instance.email,
      'deposit': instance.deposit,
      'percentage': instance.percentage,
      'revenue': instance.revenue,
    };
