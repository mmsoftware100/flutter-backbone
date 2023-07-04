class DepositData {
  bool status;
  String message;

  DepositData(
      {
        required this.status,
        required this.message,});


  static DepositData sample(){
    return DepositData(status: false, message: "message");
  }
}