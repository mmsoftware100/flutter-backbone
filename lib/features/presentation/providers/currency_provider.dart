

import 'package:base/core/error/failures.dart';
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:base/features/domain/usecases/currency_getdata.dart';
import 'package:base/features/domain/usecases/user_register.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../data/const/data.dart';
import '../../data/datasources/local_storage.dart';
import '../../domain/usecases/user_login.dart';
class CurrencyProvider extends ChangeNotifier {
  final CurrencyGetdata currencyGetdata;

  // break the rule
  final LocalStorage localStorage;

  //Crypto crypto = Crypto.sample();
  Crypto ?crypto;

  CurrencyProvider({
    required this.currencyGetdata,
    required this.localStorage
  });

  // void getData()async{
  //   user = User.sample();
  //   await localStorage.setString(string: user.accessToken, key: "accessTokenKey");
  //   notifyListeners();
  // }
  // bool isLogin(){
  //   return user.accessToken != User.sample().accessToken;
  // }
  void setCurrency(Crypto cryptoUpdated){
    crypto = cryptoUpdated;
    notifyListeners();
  }

Future<String> CurrencyGetDataPlz({
  required String start,
  required String limit
})async{
  final Either<Failure, Crypto> currencyEither = await currencyGetdata(CryptoGetdataParams(
      start: start,limit: limit
  ));
  return currencyEither.fold(
          (failure)  {
        // specify failure
        print("CurrencyProvider->CurrencyGetDataPlz->failure");
        print(failure);
        notifyListeners();
        return failure.toString();
      },
          (currencyData)  async{
        print("CurrencyProvider->CurrencyGetDataPlz->currencyData");

        crypto = currencyData;
        // TODO: stored in shared preference

        //await localStorage.setString(string: user.accessToken, key: "accessTokenKey");
        notifyListeners();
        return  "success";
      }
  );
}


  // Future<String> userRegisterPlz({
  //   required User user
  // })async{
  //   final Either<Failure, User> userEither = await userRegister(UserRegisterParams(
  //       user: user
  //   ));
  //   return userEither.fold(
  //           (failure)  {
  //         // specify failure
  //         print("UserProvider->userRegisterPlz->failure");
  //         print(failure);
  //         notifyListeners();
  //         return failure.toString();
  //       },
  //           (userData)  async{
  //         print("UserProvider->userRegisterPlz->userData");
  //         print(userData);
  //         user = userData;
  //         await localStorage.setString(string: user.accessToken, key: "accessTokenKey");
  //         notifyListeners();
  //         return  "success";
  //       }
  //   );
  // }


  // Future<String> userLoginPlz({
  //   required String email,
  //   required String password
  // })async{
  //   final Either<Failure, User> userEither = await userLogin(UserLoginParams(
  //       password: password,
  //       email: email
  //   ));
  //   return userEither.fold(
  //           (failure)  {
  //         // specify failure
  //         print("UserProvider->userLoginPlz->failure");
  //         print(failure);
  //         notifyListeners();
  //         return failure.toString();
  //       },
  //           (userData)  async{
  //         print("UserProvider->userLoginPlz->userData");
  //
  //         user = userData;
  //         // TODO: stored in shared preference
  //
  //         await localStorage.setString(string: user.accessToken, key: "accessTokenKey");
  //         notifyListeners();
  //         return  "success";
  //       }
  //   );
  // }





}
