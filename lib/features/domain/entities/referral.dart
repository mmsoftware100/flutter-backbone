class Referral {
  String profile;
  String name;
  String email;
  String level;
  double deposit;
  String percentage;
  double revenue;

  Referral(
      {
        required this.profile,
        required this.name,
        required this.email,
        required this.level,
        required this.deposit,
        required this.percentage,
        required this.revenue,});

  static Referral sample(){
    return Referral(profile: "profile", name: "name", email: "email",level: "level", deposit: 0, percentage: "percentage", revenue: 0);
  }
}