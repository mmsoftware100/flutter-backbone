// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investordeposit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvestorDepositModel _$InvestorDepositModelFromJson(
        Map<String, dynamic> json) =>
    InvestorDepositModel(
      deposit: (json['deposit'] as List<dynamic>?)
              ?.map((e) => DepositModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      level: (json['level'] as List<dynamic>?)
              ?.map((e) => LevelModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      admin: (json['admin'] as List<dynamic>?)
              ?.map((e) => AdminModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      agent: (json['agent'] as List<dynamic>?)
              ?.map((e) => AgentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      invester: (json['invester'] as List<dynamic>?)
              ?.map((e) => InvestorModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      status: json['status'] as String? ?? '',
    );

Map<String, dynamic> _$InvestorDepositModelToJson(
        InvestorDepositModel instance) =>
    <String, dynamic>{
      'deposit': instance.deposit.map((e) => e.toJson()).toList(),
      'level': instance.level.map((e) => e.toJson()).toList(),
      'admin': instance.admin.map((e) => e.toJson()).toList(),
      'agent': instance.agent.map((e) => e.toJson()).toList(),
      'invester': instance.invester.map((e) => e.toJson()).toList(),
      'status': instance.status,
    };
