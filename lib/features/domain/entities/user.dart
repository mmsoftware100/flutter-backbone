
class User{
  int id;
  String name;
  String email;
  String password;
  String referCode;
  String phone;
  String img;
  String address;
  String remark;
  String accessToken;
  String createdAt;
  String modifiedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.referCode,
    required this.phone,
    required this.img,
    required this.address,
    required this.remark,
    required this.accessToken,
    required this.createdAt,
    required this.modifiedAt
  });


  static User sample () => User(
      id: 0,
      name: "name",
      email: "email",
      password: "password",
      referCode: "referCode",
      phone: "phone",
      img: "img",
      address: "address",
      remark: "remark",
      accessToken: "accessToken",
      createdAt: "createdAt",
      modifiedAt: "modifiedAt"
  );
}
