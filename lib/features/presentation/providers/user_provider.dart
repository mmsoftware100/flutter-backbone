

import 'package:base/core/error/failures.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:base/features/domain/usecases/user_register.dart';
import 'package:base/features/domain/usecases/user_update.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/const/data.dart';
import '../../data/datasources/local_storage.dart';
import '../../domain/usecases/user_login.dart';

const String EMAIL_KEY = "email";
const String PASSWORD_KEY = "password";

class UserProvider extends ChangeNotifier {
    final UserRegister userRegister;
    final UserLogin userLogin;
    final UserUpdate userUpdate;

    // break the rule
    final LocalStorage localStorage;

    User user = User.sample();






    UserProvider({
        required this.userRegister,
        required this.userLogin,
        required this.userUpdate,
        required this.localStorage
    });


    Future<void> logout()async{
      user = User.sample();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      //await localStorage.setString(string: user.accessToken, key: "accessTokenKey");
      await prefs.setString(EMAIL_KEY, "");
      await prefs.setString(PASSWORD_KEY, "");
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
                if(failure is GeneralFailure){
                  print(failure.message);
                  return failure.message;
                }
                return failure.toString();
            },
            (userData)  async{
                print("UserProvider->userRegisterPlz->userData");
                print(userData);
                user = userData;
                //await localStorage.setString(string: user.accessToken, key: "accessTokenKey");
                notifyListeners();
               return  "success";
            }
        );

    }


    Future<String> autoLogin()async{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String email = prefs.getString(EMAIL_KEY) ?? "";
      String password = prefs.getString(PASSWORD_KEY) ?? "";
      userpa = password;
      print("auto Login");
      print(email);
      print(password);
      return userLoginPlz(email: email, password: password);
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
                if(failure is GeneralFailure){
                  return failure.message;
                }
                return failure.toString();
            },
                (userData)  async{
                print("UserProvider->userLoginPlz->userData");

                user = userData;
                // TODO: stored in shared preference
                // Obtain shared preferences.
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString(EMAIL_KEY, email);
                await prefs.setString(PASSWORD_KEY, password);

                //await localStorage.setString(string: user.accessToken, key: "accessTokenKey");
                notifyListeners();
                return  "success";
            }
        );

    }




    Future<String> userUpdatePlz({
      required String username,
      required String email,
      required String phone,
      required String profile_picture,
      required String address,
      required String remark,
      required String password,
      required String level,
      required String accessToken,
      required String wallet_address,
      required String deposit_address,
      required String referCode,
    })async{
      final Either<Failure, User> userEither = await userUpdate(UserUpdateParams(user: User(username: username, email: email, phone: phone, profile_picture: profile_picture, address: address, remark: remark, password: password, level: level, accessToken: accessToken, wallet_address: wallet_address, deposit_address: deposit_address, referCode: referCode)));
      return userEither.fold(
              (failure)  {
            // specify failure
            print("UserProvider->userUpdatePlz->failure");
            print(failure);
            notifyListeners();
            return failure.toString();
          },
              (userData)  async{
            print("UserProvider->userUpdatePlz->userData");

            user = userData;
            // TODO: stored in shared preference

            await localStorage.setString(string: user.accessToken, key: "accessTokenKey");
            notifyListeners();
            return  "success";
          }
      );
    }


}
