class Withdraw {
  int? id;
  String? investerId;
  String? paymentAccount;
  String? withdrawAmount;
  String? referProfitAmount;
  String? depositProfitAmount;
  String? totaldepositAmount;
  String? status;
  String? providerId;
  String? userModel;
  String? remark;
  String? createdAt;
  String? updatedAt;

  Withdraw(
      {this.id,
        this.investerId,
        this.paymentAccount,
        this.withdrawAmount,
        this.referProfitAmount,
        this.depositProfitAmount,
        this.totaldepositAmount,
        this.status,
        this.providerId,
        this.userModel,
        this.remark,
        this.createdAt,
        this.updatedAt});

  Withdraw.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    investerId = json['invester_id'];
    paymentAccount = json['payment_account'];
    withdrawAmount = json['withdraw_amount'];
    referProfitAmount = json['refer_profit_amount'];
    depositProfitAmount = json['deposit_profit_amount'];
    totaldepositAmount = json['totaldeposit_amount'];
    status = json['status'];
    providerId = json['provider_id'];
    userModel = json['user_model'];
    remark = json['remark'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['invester_id'] = this.investerId;
    data['payment_account'] = this.paymentAccount;
    data['withdraw_amount'] = this.withdrawAmount;
    data['refer_profit_amount'] = this.referProfitAmount;
    data['deposit_profit_amount'] = this.depositProfitAmount;
    data['totaldeposit_amount'] = this.totaldepositAmount;
    data['status'] = this.status;
    data['provider_id'] = this.providerId;
    data['user_model'] = this.userModel;
    data['remark'] = this.remark;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
