class AllLevel {
  int? id;
  String? levelName;
  String? point;
  String? amount;
  String? remark;
  String? createdAt;
  String? updatedAt;

  AllLevel(
      {this.id,
        this.levelName,
        this.point,
        this.amount,
        this.remark,
        this.createdAt,
        this.updatedAt});

  AllLevel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    levelName = json['level_name'];
    point = json['point'];
    amount = json['amount'];
    remark = json['remark'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['level_name'] = this.levelName;
    data['point'] = this.point;
    data['amount'] = this.amount;
    data['remark'] = this.remark;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}