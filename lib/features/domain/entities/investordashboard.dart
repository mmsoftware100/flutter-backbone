import 'package:base/features/domain/entities/authuser.dart';
import 'package:base/features/domain/entities/authuserdeposit.dart';
import 'package:base/features/domain/entities/authuserpayment.dart';
import 'package:base/features/domain/entities/deposit.dart';
import 'package:base/features/domain/entities/level.dart';
import 'package:base/features/domain/entities/refer.dart';

class InvestorDashboard {
  int? authId;
  Refer? refer;
  List<int>? referFirstArray;
  List<int>? referSecondArray;
  List<int>? referThirdArray;
  List<Deposit>? deposit;
  List<Level>? level;
  String? todayDate;
  int? depositProfit;
  String? payment;
  String? sixmonth;
  int? withdrawAmount;
  String? threeMonthFivepercentIncreaseDate;
  String? sixMonthTenpercentIncreaseDate;
  String? nineMonthFifteenpercentIncreaseDate;
  String? twelveMonthIncreaseDate;
  AuthUser? authUser;
  Null? authUserImage;
  List<AuthUserDeposit>? authUserDeposit;
  AuthUserPayment? authUserPayment;
  int? totalReferProfitAmount;
  int? totalDepositProfitAmount;
  int? totalDepositAmount;

  InvestorDashboard(
      {this.authId,
        this.refer,
        this.referFirstArray,
        this.referSecondArray,
        this.referThirdArray,
        this.deposit,
        this.level,
        this.todayDate,
        this.depositProfit,
        this.payment,
        this.sixmonth,
        this.withdrawAmount,
        this.threeMonthFivepercentIncreaseDate,
        this.sixMonthTenpercentIncreaseDate,
        this.nineMonthFifteenpercentIncreaseDate,
        this.twelveMonthIncreaseDate,
        this.authUser,
        this.authUserImage,
        this.authUserDeposit,
        this.authUserPayment,
        this.totalReferProfitAmount,
        this.totalDepositProfitAmount,
        this.totalDepositAmount});

  InvestorDashboard.fromJson(Map<String, dynamic> json) {
    authId = json['auth_id'];
    refer = json['refer'] != null ? new Refer.fromJson(json['refer']) : null;
    referFirstArray = json['refer_first_array'].cast<int>();
    referSecondArray = json['refer_second_array'].cast<int>();
    referThirdArray = json['refer_third_array'].cast<int>();
    if (json['deposit'] != null) {
      deposit = <Deposit>[];
      json['deposit'].forEach((v) {
        deposit!.add(new Deposit.fromJson(v));
      });
    }
    if (json['level'] != null) {
      level = <Level>[];
      json['level'].forEach((v) {
        level!.add(new Level.fromJson(v));
      });
    }
    todayDate = json['todayDate'];
    depositProfit = json['deposit_profit'];
    payment = json['payment'];
    sixmonth = json['sixmonth'];
    withdrawAmount = json['withdraw_amount'];
    threeMonthFivepercentIncreaseDate =
    json['three_month_fivepercent_increase_date'];
    sixMonthTenpercentIncreaseDate = json['six_month_tenpercent_increase_date'];
    nineMonthFifteenpercentIncreaseDate =
    json['nine_month_fifteenpercent_increase_date'];
    twelveMonthIncreaseDate = json['twelve_month_increase_date'];
    authUser = json['auth_user'] != null
        ? new AuthUser.fromJson(json['auth_user'])
        : null;
    authUserImage = json['auth_user_image'];
    if (json['auth_user_deposit'] != null) {
      authUserDeposit = <AuthUserDeposit>[];
      json['auth_user_deposit'].forEach((v) {
        authUserDeposit!.add(new AuthUserDeposit.fromJson(v));
      });
    }
    authUserPayment = json['auth_user_payment'] != null
        ? new AuthUserPayment.fromJson(json['auth_user_payment'])
        : null;
    totalReferProfitAmount = json['total_refer_profit_amount'];
    totalDepositProfitAmount = json['total_deposit_profit_amount'];
    totalDepositAmount = json['total_deposit_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['auth_id'] = this.authId;
    if (this.refer != null) {
      data['refer'] = this.refer!.toJson();
    }
    data['refer_first_array'] = this.referFirstArray;
    data['refer_second_array'] = this.referSecondArray;
    data['refer_third_array'] = this.referThirdArray;
    if (this.deposit != null) {
      data['deposit'] = this.deposit!.map((v) => v.toJson()).toList();
    }
    if (this.level != null) {
      data['level'] = this.level!.map((v) => v.toJson()).toList();
    }
    data['todayDate'] = this.todayDate;
    data['deposit_profit'] = this.depositProfit;
    data['payment'] = this.payment;
    data['sixmonth'] = this.sixmonth;
    data['withdraw_amount'] = this.withdrawAmount;
    data['three_month_fivepercent_increase_date'] =
        this.threeMonthFivepercentIncreaseDate;
    data['six_month_tenpercent_increase_date'] =
        this.sixMonthTenpercentIncreaseDate;
    data['nine_month_fifteenpercent_increase_date'] =
        this.nineMonthFifteenpercentIncreaseDate;
    data['twelve_month_increase_date'] = this.twelveMonthIncreaseDate;
    if (this.authUser != null) {
      data['auth_user'] = this.authUser!.toJson();
    }
    data['auth_user_image'] = this.authUserImage;
    if (this.authUserDeposit != null) {
      data['auth_user_deposit'] =
          this.authUserDeposit!.map((v) => v.toJson()).toList();
    }
    if (this.authUserPayment != null) {
      data['auth_user_payment'] = this.authUserPayment!.toJson();
    }
    data['total_refer_profit_amount'] = this.totalReferProfitAmount;
    data['total_deposit_profit_amount'] = this.totalDepositProfitAmount;
    data['total_deposit_amount'] = this.totalDepositAmount;
    return data;
  }
}