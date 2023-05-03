import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/category.dart';
import '../../domain/entities/user.dart';


part 'category_model.g.dart';
@JsonSerializable(explicitToJson: true)
class CategoryModel{

  @JsonKey(defaultValue: 0)
  int id;

  @JsonKey(name: 'name' ,defaultValue: "name")
  String name;

  @JsonKey(name: 'img_url' ,defaultValue: "image")
  String image;
  CategoryModel({
    required this.id,
    required this.name,
    required this.image
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return _$CategoryModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  Category toEntity(){
    return Category(id: id, name: name, image: image);
  }
}


