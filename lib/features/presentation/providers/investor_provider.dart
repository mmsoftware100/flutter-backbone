

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
            (investorDashboardListUpdated)  async{
          print("InvestorProvider->selectInvestorDashboardPlz->userData");
          investordashboard = investorDashboardListUpdated;
          notifyListeners();
          return  "success";
        }
    );
  }

  Future<String> selectInvestorReferralPlz({
    required String accessToken
  })async{
    final Either<Failure, List<InvestorReferral>> investorReferralEither = await selectInvestorReferral(SelectInvestorReferralParams(
        accessToken: accessToken
    ));
    return investorReferralEither.fold(
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
    final Either<Failure, List<InvestorPayment>> investorPaymentEither = await selectInvestorPayment(SelectInvestorPaymentParams(
        accessToken: accessToken
    ));
    return investorPaymentEither.fold(
            (failure)  {
          // specify failure
          print("InvestorProvider->selectInvestorPaymentPlz->failure");
          print(failure);
          notifyListeners();
          return failure.toString();
        },
            (investorDashboardListUpdated)  async{
          print("InvestorProvider->selectInvestorPaymentPlz->userData");
          investorpayment = investorDashboardListUpdated;
          notifyListeners();
          return  "success";
        }
    );
  }





}
