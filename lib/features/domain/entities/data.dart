class Data {
  String username;
  String email;
  String userlevel;
  double total_deposit_amount;
  String wallet_address;

  Data(
      {
        required this.username,
        required this.email,
        required this.userlevel,
        required this.total_deposit_amount,
        required this.wallet_address});


  static Data sample(){
    return Data(username: "username", email: "email", userlevel: "userlevel", total_deposit_amount: 0, wallet_address: "wallet_address");
  }
}