class Deposit {
  int id;
  String investerId;
  String createUser;
  String model;
  String depositAmount;
  String levelId;
  String point;
  String remark;
  String createdAt;
  String updatedAt;

  Deposit(
      {
        required this.id,
        required this.investerId,
        required this.createUser,
        required this.model,
        required this.depositAmount,
        required this.levelId,
        required this.point,
        required this.remark,
        required this.createdAt,
        required this.updatedAt
      });

  // Deposit.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   investerId = json['invester_id'];
  //   createUser = json['create_user'];
  //   model = json['model'];
  //   depositAmount = json['deposit_amount'];
  //   levelId = json['level_id'];
  //   point = json['point'];
  //   remark = json['remark'];
  //   createdAt = json['created_at'];
  //   updatedAt = json['updated_at'];
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['invester_id'] = this.investerId;
  //   data['create_user'] = this.createUser;
  //   data['model'] = this.model;
  //   data['deposit_amount'] = this.depositAmount;
  //   data['level_id'] = this.levelId;
  //   data['point'] = this.point;
  //   data['remark'] = this.remark;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   return data;
  // }
}