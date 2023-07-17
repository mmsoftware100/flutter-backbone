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
      level: json['level'] as String? ?? 'level',
      deposit: (json['deposit'] as num?)?.toDouble() ?? 0,
      percentage: json['percentage'] as String? ?? 'percentage',
      revenue: (json['revenue'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$ReferralModelToJson(ReferralModel instance) =>
    <String, dynamic>{
      'profile': instance.profile,
      'name': instance.name,
      'email': instance.email,
      'level': instance.level,
      'deposit': instance.deposit,
      'percentage': instance.percentage,
      'revenue': instance.revenue,
    };
