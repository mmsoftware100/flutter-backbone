// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investorwithdraw_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvestorWithdrawModel _$InvestorWithdrawModelFromJson(
        Map<String, dynamic> json) =>
    InvestorWithdrawModel(
      withdraw: (json['withdraw'] as List<dynamic>?)
              ?.map((e) => WithdrawModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      authUser: json['auth_user'] == null
          ? null
          : AuthUserModel.fromJson(json['auth_user'] as Map<String, dynamic>),
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

Map<String, dynamic> _$InvestorWithdrawModelToJson(
        InvestorWithdrawModel instance) =>
    <String, dynamic>{
      'withdraw': instance.withdraw.map((e) => e.toJson()).toList(),
      'auth_user': instance.authUser?.toJson(),
      'level': instance.level.map((e) => e.toJson()).toList(),
      'admin': instance.admin.map((e) => e.toJson()).toList(),
      'agent': instance.agent.map((e) => e.toJson()).toList(),
      'invester': instance.invester.map((e) => e.toJson()).toList(),
      'status': instance.status,
    };
