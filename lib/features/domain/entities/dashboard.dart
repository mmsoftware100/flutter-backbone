class Dashboard {
  double deposit_amount;
  double total_points;
  double referral_investers;
  double referral_balance;
  double deposit_profit_balance;
  double withdraw_balance;
  double total_net_profit;

  Dashboard(
      {
        required this.deposit_amount,
        required this.total_points,
        required this.referral_investers,
        required this.referral_balance,
        required this.deposit_profit_balance,
        required this.withdraw_balance,
        required this.total_net_profit,});

  static Dashboard sample(){
    return Dashboard(deposit_amount: 0, total_points: 0, referral_investers: 0, referral_balance: 0, deposit_profit_balance: 0, withdraw_balance: 0, total_net_profit: 0);
  }
}