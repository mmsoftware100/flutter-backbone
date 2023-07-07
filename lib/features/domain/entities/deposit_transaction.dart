class DepositTransaction {
  String investor;
  String topup_provider;
  double deposit_amount;
  double point;
  String topup_date;
  String remark;
  String status;

  DepositTransaction(
      {
        required this.investor,
        required this.topup_provider,
        required this.deposit_amount,
        required this.point,
        required this.topup_date,
        required this.remark,
        required this.status,});

  static DepositTransaction sample(){
    return DepositTransaction(investor: "investor", topup_provider: "topup_provider", deposit_amount: 0, point: 0, topup_date: "2023-07-04", remark: "remark", status: "status");
  }
}