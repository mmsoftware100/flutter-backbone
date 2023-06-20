class CurrencyExchange {
  int id;
  String name;
  String symbol;
  String emailVerifiedAt;
  String phone;
  String img;
  String address;
  String remark;
  String createdAt;
  String updatedAt;

  CurrencyExchange(
      { required this.id,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.phone,
        required this.img,
        required this.address,
        required this.remark,
        required this.createdAt,
        required this.updatedAt
      });

}