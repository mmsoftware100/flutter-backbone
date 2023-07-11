

import 'package:base/core/error/failures.dart';
import 'package:base/features/domain/entities/dashboard.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:base/features/domain/usecases/get_dashboard.dart';
import 'package:base/features/domain/usecases/user_register.dart';
import 'package:base/features/domain/usecases/user_update.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../data/const/data.dart';
import '../../data/datasources/local_storage.dart';
import '../../domain/usecases/user_login.dart';
class DashboardProvider extends ChangeNotifier {
  //final GetDashboard getDashboard;

  // break the rule
  // final LocalStorage localStorage;

  Dashboard dashboard = Dashboard.sample();

  /*
  DashboardProvider({
    //required this.getDashboard,
  });

   */

  // void logout()async{
  //   user = User.sample();
  //   await localStorage.setString(string: user.accessToken, key: "accessTokenKey");
  //   notifyListeners();
  // }
  // bool isLogin(){
  //   return user.accessToken != User.sample().accessToken;
  // }
  void setDashboard(Dashboard DashboardUpdated){
    dashboard = DashboardUpdated;
    notifyListeners();
  }
  Future<String> getDashboardPlz({
    required String accessToken
  })async{

    /*
    final Either<Failure, Dashboard> dashboardEither = await getDashboard(GetDashboardParams(
        accessToken: accessToken
    ));
    return dashboardEither.fold(
            (failure)  {
          // specify failure
          print("DashboardProvider->getDashboardPlz->failure");
          print(failure);
          notifyListeners();
          return failure.toString();
        },
            (dashboardData)  async{
          print("DashboardProvider->getDashboardPlz->dashboardData");
          print(dashboardData);
          dashboard = dashboardData;
          notifyListeners();
          return  "success";
        }
    );

     */

    throw UnImplementedFailure();
  }
}
