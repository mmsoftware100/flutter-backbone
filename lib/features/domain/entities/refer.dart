class Refer {
  int? id;
  String? originalInvester;
  String? referInvester;
  String? referCode;
  String? first;
  String? second;
  String? third;
  String? createdAt;
  String? updatedAt;

  Refer(
      {this.id,
        this.originalInvester,
        this.referInvester,
        this.referCode,
        this.first,
        this.second,
        this.third,
        this.createdAt,
        this.updatedAt});

  Refer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    originalInvester = json['original_invester'];
    referInvester = json['refer_invester'];
    referCode = json['refer_code'];
    first = json['first'];
    second = json['second'];
    third = json['third'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['original_invester'] = this.originalInvester;
    data['refer_invester'] = this.referInvester;
    data['refer_code'] = this.referCode;
    data['first'] = this.first;
    data['second'] = this.second;
    data['third'] = this.third;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}