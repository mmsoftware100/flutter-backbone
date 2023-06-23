import 'package:base/features/domain/entities/alldeposit.dart';
import 'package:base/features/domain/entities/allinvestor.dart';
import 'package:base/features/domain/entities/alllevel.dart';
import 'package:base/features/domain/entities/refer.dart';

class InvestorReferral {
  int? authId;
  String? authReferCode;
  Refer? refer;
  List<int>? referFirstArray;
  List<int>? referSecondArray;
  List<int>? referThirdArray;
  List<AllInvester>? allInvester;
  List<AllDeposit>? allDeposit;
  List<AllLevel>? allLevel;
  String? todayDate;
  String? paymentAccount;
  int? withdrawAmount;

  InvestorReferral(
      {this.authId,
        this.authReferCode,
        this.refer,
        this.referFirstArray,
        this.referSecondArray,
        this.referThirdArray,
        this.allInvester,
        this.allDeposit,
        this.allLevel,
        this.todayDate,
        this.paymentAccount,
        this.withdrawAmount});

  // InvestorReferral.fromJson(Map<String, dynamic> json) {
  //   authId = json['auth_id'];
  //   authReferCode = json['auth_refer_code'];
  //   refer = json['refer'] != null ? new Refer.fromJson(json['refer']) : null;
  //   referFirstArray = json['refer_first_array'].cast<int>();
  //   referSecondArray = json['refer_second_array'].cast<int>();
  //   referThirdArray = json['refer_third_array'].cast<int>();
  //   if (json['all_invester'] != null) {
  //     allInvester = <AllInvester>[];
  //     json['all_invester'].forEach((v) {
  //       allInvester!.add(new AllInvester.fromJson(v));
  //     });
  //   }
  //   if (json['all_deposit'] != null) {
  //     allDeposit = <AllDeposit>[];
  //     json['all_deposit'].forEach((v) {
  //       allDeposit!.add(new AllDeposit.fromJson(v));
  //     });
  //   }
  //   if (json['all_level'] != null) {
  //     allLevel = <AllLevel>[];
  //     json['all_level'].forEach((v) {
  //       allLevel!.add(new AllLevel.fromJson(v));
  //     });
  //   }
  //   todayDate = json['todayDate'];
  //   paymentAccount = json['payment_account'];
  //   withdrawAmount = json['withdraw_amount'];
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['auth_id'] = this.authId;
  //   data['auth_refer_code'] = this.authReferCode;
  //   if (this.refer != null) {
  //     data['refer'] = this.refer!.toJson();
  //   }
  //   data['refer_first_array'] = this.referFirstArray;
  //   data['refer_second_array'] = this.referSecondArray;
  //   data['refer_third_array'] = this.referThirdArray;
  //   if (this.allInvester != null) {
  //     data['all_invester'] = this.allInvester!.map((v) => v.toJson()).toList();
  //   }
  //   if (this.allDeposit != null) {
  //     data['all_deposit'] = this.allDeposit!.map((v) => v.toJson()).toList();
  //   }
  //   if (this.allLevel != null) {
  //     data['all_level'] = this.allLevel!.map((v) => v.toJson()).toList();
  //   }
  //   data['todayDate'] = this.todayDate;
  //   data['payment_account'] = this.paymentAccount;
  //   data['withdraw_amount'] = this.withdrawAmount;
  //   return data;
  // }
}
