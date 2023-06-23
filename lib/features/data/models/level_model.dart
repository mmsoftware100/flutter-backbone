
import 'package:base/features/domain/entities/level.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/agent.dart';


part 'level_model.g.dart';
@JsonSerializable(explicitToJson: true)



class LevelModel {

  @JsonKey(name: 'id', defaultValue: 0)
  int id;

  @JsonKey(name: 'level_name', defaultValue: "levelName")
  String levelName;

  @JsonKey(name: 'point', defaultValue: "point")
  String point;

  @JsonKey(name: 'amount', defaultValue: "amount")
  String amount;

  @JsonKey(name: 'remark', defaultValue: "remark")
  String remark;

  @JsonKey(name: 'created_at', defaultValue: "createdAt")
  String createdAt;

  @JsonKey(name: 'updated_at', defaultValue: "updatedAt")
  String updatedAt;

  LevelModel({
    required this.id,
    required this.levelName,
    required this.point,
    required this.amount,
    required this.remark,
    required this.createdAt,
    required this.updatedAt
  });

  Level toEntity(){
    return Level(
        id: id,
        levelName: levelName,
        point: point,
        amount: amount,
        remark: remark,
        createdAt: createdAt,
        updatedAt: updatedAt
    );
  }


  static LevelModel fromEntity(Level admin){
    return LevelModel(
      id: admin.id,
      levelName: admin.levelName,
      point: admin.point,
      amount: admin.amount,
      remark: admin.remark,
      createdAt: admin.createdAt,
      updatedAt: admin.updatedAt
    );
  }


  factory LevelModel.fromJson(Map<String, dynamic> json) =>  _$LevelModelFromJson(json);

  Map<String, dynamic> toJson() => _$LevelModelToJson(this);

}