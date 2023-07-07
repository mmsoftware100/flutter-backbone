
class User{
  String username;
  String email;
  String phone;
  String profile_picture;
  String address;
  String remark;
  String password;
  String level;
  String accessToken;
  String wallet_address;
  String deposit_address;
  String referCode;
  User({
    required this.username,
    required this.email,
    required this.phone,
    required this.profile_picture,
    required this.address,
    required this.remark,
    required this.password,
    required this.level,
    required this.accessToken,
    required this.wallet_address,
    required this.deposit_address,
    required this.referCode,
  });


  static User sample () => User(username: "username", email: "email", phone: "phone", profile_picture: "profile_picture", address: "address", remark: "remark", password: "password", level: "level", accessToken: "accessToken", wallet_address: "wallet_address", deposit_address: "deposit_address", referCode: "referCode");
}
