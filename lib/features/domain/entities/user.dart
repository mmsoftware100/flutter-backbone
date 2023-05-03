
class User{
  int id;
  String name;
  String email;
  String phoneNo;
  String accessToken;
  String createdAt;
  String modifiedAt;
  bool dev;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.accessToken,
    required this.createdAt,
    required this.modifiedAt,
    required this.dev,
  });


  static User sample () => User(id: 0, name: "name", email: "email", phoneNo: "phoneNo", accessToken: "accessToken", createdAt: "createdAt", modifiedAt: "modifiedAt", dev: true);
}
