import 'package:base/features/domain/entities/allinvestor.dart';
import 'package:base/features/domain/entities/alllevel.dart';

class InvestorPayment {
  int? authId;
  String? authPaymentAccount;
  List<AllInvester>? allInvester;
  int? totalDepositAmount;
  int? totalWithdrawAmount;
  int? totalReferProfit;
  int? totalDepositProfit;
  List<AllLevel>? allLevel;
  String? todayDate;

  InvestorPayment(
      {this.authId,
        this.authPaymentAccount,
        this.allInvester,
        this.totalDepositAmount,
        this.totalWithdrawAmount,
        this.totalReferProfit,
        this.totalDepositProfit,
        this.allLevel,
        this.todayDate});

  // InvestorPayment.fromJson(Map<String, dynamic> json) {
  //   authId = json['auth_id'];
  //   authPaymentAccount = json['auth_payment_account'];
  //   if (json['all_invester'] != null) {
  //     allInvester = <AllInvester>[];
  //     json['all_invester'].forEach((v) {
  //       allInvester!.add(new AllInvester.fromJson(v));
  //     });
  //   }
  //   totalDepositAmount = json['total_deposit_amount'];
  //   totalWithdrawAmount = json['total_withdraw_amount'];
  //   totalReferProfit = json['total_refer_profit'];
  //   totalDepositProfit = json['total_deposit_profit'];
  //   if (json['all_level'] != null) {
  //     allLevel = <AllLevel>[];
  //     json['all_level'].forEach((v) {
  //       allLevel!.add(new AllLevel.fromJson(v));
  //     });
  //   }
  //   todayDate = json['todayDate'];
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['auth_id'] = this.authId;
  //   data['auth_payment_account'] = this.authPaymentAccount;
  //   if (this.allInvester != null) {
  //     data['all_invester'] = this.allInvester!.map((v) => v.toJson()).toList();
  //   }
  //   data['total_deposit_amount'] = this.totalDepositAmount;
  //   data['total_withdraw_amount'] = this.totalWithdrawAmount;
  //   data['total_refer_profit'] = this.totalReferProfit;
  //   data['total_deposit_profit'] = this.totalDepositProfit;
  //   if (this.allLevel != null) {
  //     data['all_level'] = this.allLevel!.map((v) => v.toJson()).toList();
  //   }
  //   data['todayDate'] = this.todayDate;
  //   return data;
  // }
}
