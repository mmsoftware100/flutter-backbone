class WithdrawTransaction {
  String investor;
  String withdraw_provider;
  double withdraw_amount;
  String withdraw_date;
  String remark;
  String status;

  WithdrawTransaction(
      {
        required this.investor,
        required this.withdraw_provider,
        required this.withdraw_amount,
        required this.withdraw_date,
        required this.remark,
        required this.status,});

  static WithdrawTransaction sample(){
    return WithdrawTransaction(investor: "investor", withdraw_provider: "withdraw_provider", withdraw_amount: 0, withdraw_date: "2023-07-04", remark: "remark", status: "status");
  }
}