class DepositAddress {
  String name;
  String address;

  DepositAddress(
      {
        required this.name,
        required this.address,});

  static DepositAddress sample(){
    return DepositAddress(name: "name", address: "address");
  }
}