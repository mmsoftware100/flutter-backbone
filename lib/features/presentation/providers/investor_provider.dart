

import 'package:base/core/error/failures.dart';
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/domain/entities/investordashboard.dart';
import 'package:base/features/domain/entities/investorpayment.dart';
import 'package:base/features/domain/entities/investorreferral.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:base/features/domain/usecases/select_crypto.dart';
import 'package:base/features/domain/usecases/select_investordashboard.dart';
import 'package:base/features/domain/usecases/select_investorpayment.dart';
import 'package:base/features/domain/usecases/select_investorreferral.dart';
import 'package:base/features/domain/usecases/user_register.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../data/const/data.dart';
import '../../data/datasources/local_storage.dart';
import '../../domain/usecases/user_login.dart';
class InvestorProvider extends ChangeNotifier {
  // use case
  final SelectInvestorDashboard selectInvestorDashboard;
  final SelectInvestorReferral selectInvestorReferral;
  final SelectInvestorPayment selectInvestorPayment;

  InvestorProvider({
    required this.selectInvestorDashboard,
    required this.selectInvestorReferral,
    required this.selectInvestorPayment
  });


  List<InvestorDashboard> investordashboard = [];
  List<InvestorReferral> investorreferral = [];
  List<InvestorPayment> investorpayment = [];

  Future<String> selectInvestorDashboardPlz({
    required String accessToken
  })async{
    final Either<Failure, List<InvestorDashboard>> investordashboardEither = await selectInvestorDashboard(SelectInvestorDashboardParams(
        accessToken: accessToken
    ));
    return investordashboardEither.fold(
            (failure)  {
          // specify failure
          print("InvestorProvider->selectInvestorDashboardPlz->failure");
          print(failure);
          notifyListeners();
          return failure.toString();
        },
            (investordashboardListUpdated)  async{
          print("InvestorProvider->selectInvestorDashboardPlz->userData");
          investordashboard = investordashboardListUpdated;
          notifyListeners();
          return  "success";
        }
    );
  }

  Future<String> selectInvestorReferralPlz({
    required String accessToken
  })async{
    final Either<Failure, List<InvestorReferral>> investorreferralEither = await selectInvestorReferral(SelectInvestorReferralParams(
        accessToken: accessToken
    ));
    return investorreferralEither.fold(
            (failure)  {
          // specify failure
          print("InvestorProvider->selectInvestorReferralPlz->failure");
          print(failure);
          notifyListeners();
          return failure.toString();
        },
            (investordashboardListUpdated)  async{
          print("InvestorProvider->selectInvestorReferralPlz->userData");
          investorreferral = investordashboardListUpdated;
          notifyListeners();
          return  "success";
        }
    );
  }

  Future<String> selectInvestorPaymentPlz({
    required String accessToken
  })async{
    final Either<Failure, List<InvestorPayment>> investorpaymentEither = await selectInvestorPayment(SelectInvestorPaymentParams(
        accessToken: accessToken
    ));
    return investorpaymentEither.fold(
            (failure)  {
          // specify failure
          print("InvestorProvider->selectInvestorPaymentPlz->failure");
          print(failure);
          notifyListeners();
          return failure.toString();
        },
            (investordashboardListUpdated)  async{
          print("InvestorProvider->selectInvestorPaymentPlz->userData");
          investorpayment = investordashboardListUpdated;
          notifyListeners();
          return  "success";
        }
    );
  }





}
