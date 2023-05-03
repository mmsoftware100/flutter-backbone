// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int? ?? 0,
      uid: json['uid'] as String? ?? 'uid',
      name: json['name'] as String? ?? 'name',
      email: json['email'] as String? ?? 'email',
      password: json['password'] as String? ?? 'password',
      accessToken: json['access_token'] as String? ?? 'access_token',
      phone: json['phone'] as String? ?? 'phone',
      city: json['city'] as String? ?? 'city',
      age: json['age'] as String? ?? 'age',
      gender: json['gender'] as String? ?? 'gender',
      photoUrl: json['photo_url'] as String? ?? 'photo_url',
      roleId: json['role_id'] as int? ?? 0,
      createdAt: json['created_at'] as String? ?? 'created_at',
      updatedAt: json['updated_at'] as String? ?? 'updated_at',
      userStatistics: json['user_statistics'] == null
          ? null
          : UserStatisticsModel.fromJson(
              json['user_statistics'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'access_token': instance.accessToken,
      'phone': instance.phone,
      'city': instance.city,
      'age': instance.age,
      'gender': instance.gender,
      'photo_url': instance.photoUrl,
      'role_id': instance.roleId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'user_statistics': instance.userStatistics?.toJson(),
    };
