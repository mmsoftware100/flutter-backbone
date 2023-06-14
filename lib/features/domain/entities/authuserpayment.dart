class AuthUserPayment {
  int? id;
  String? investerId;
  String? paymentAccount;
  String? createdAt;
  String? updatedAt;

  AuthUserPayment(
      {this.id,
        this.investerId,
        this.paymentAccount,
        this.createdAt,
        this.updatedAt});

  AuthUserPayment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    investerId = json['invester_id'];
    paymentAccount = json['payment_account'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['invester_id'] = this.investerId;
    data['payment_account'] = this.paymentAccount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}