class Referral {
  String profile;
  String name;
  String email;
  double deposit;
  double percentage;
  double revenue;

  Referral(
      {
        required this.profile,
        required this.name,
        required this.email,
        required this.deposit,
        required this.percentage,
        required this.revenue,});

  static Referral sample(){
    return Referral(profile: "profile", name: "name", email: "email", deposit: 0, percentage: 0, revenue: 0);
  }
}