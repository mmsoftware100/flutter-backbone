class Invester {
  int id;
  String name;
  String email;
  String emailVerifiedAt;
  String phone;
  String img;
  String address;
  String remark;
  String referCode;
  String createdAt;
  String updatedAt;

  Invester(
      {
        required this.id,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.phone,
        required this.img,
        required this.address,
        required this.remark,
        required this.referCode,
        required this.createdAt,
        required this.updatedAt});

  // Invester.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   name = json['name'];
  //   email = json['email'];
  //   emailVerifiedAt = json['email_verified_at'];
  //   phone = json['phone'];
  //   img = json['img'];
  //   address = json['address'];
  //   remark = json['remark'];
  //   referCode = json['refer_code'];
  //   createdAt = json['created_at'];
  //   updatedAt = json['updated_at'];
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['email'] = this.email;
  //   data['email_verified_at'] = this.emailVerifiedAt;
  //   data['phone'] = this.phone;
  //   data['img'] = this.img;
  //   data['address'] = this.address;
  //   data['remark'] = this.remark;
  //   data['refer_code'] = this.referCode;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   return data;
  // }
}