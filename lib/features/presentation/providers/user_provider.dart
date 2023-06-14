

import 'package:base/core/error/failures.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:base/features/domain/usecases/user_register.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../data/const/data.dart';
import '../../data/datasources/local_storage.dart';
import '../../domain/usecases/user_login.dart';
class UserProvider extends ChangeNotifier {
    final UserRegister userRegister;
    final UserLogin userLogin;

    // break the rule
    final LocalStorage localStorage;

    User user = User.sample();

    UserProvider({
        required this.userRegister,
        required this.userLogin,
      required this.localStorage
    });

    void logout()async{
      user = User.sample();
      await localStorage.setString(string: user.accessToken, key: "accessTokenKey");
      notifyListeners();
    }
    bool isLogin(){
      return user.accessToken != User.sample().accessToken;
    }
    void setUser(User userUpdated){
      user = userUpdated;
      notifyListeners();
    }
    Future<String> userRegisterPlz({
        required User user
   })async{
        final Either<Failure, User> userEither = await userRegister(UserRegisterParams(
          user: user
        ));
        return userEither.fold(
            (failure)  {
                // specify failure
                print("UserProvider->userRegisterPlz->failure");
                print(failure);
                notifyListeners();
                return failure.toString();
            },
            (userData)  async{
                print("UserProvider->userRegisterPlz->userData");
                print(userData);
                user = userData;
                await localStorage.setString(string: user.accessToken, key: "accessTokenKey");
                notifyListeners();
               return  "success";
            }
        );
    }


    Future<String> userLoginPlz({
        required String email,
        required String password
    })async{
        final Either<Failure, User> userEither = await userLogin(UserLoginParams(
            password: password,
            email: email
        ));
        return userEither.fold(
                (failure)  {
                // specify failure
                print("UserProvider->userLoginPlz->failure");
                print(failure);
                notifyListeners();
                return failure.toString();
            },
                (userData)  async{
                print("UserProvider->userLoginPlz->userData");

                user = userData;
                // TODO: stored in shared preference

                await localStorage.setString(string: user.accessToken, key: "accessTokenKey");
                notifyListeners();
                return  "success";
            }
        );
    }





}
