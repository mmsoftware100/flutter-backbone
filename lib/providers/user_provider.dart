

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:myan_quiz/domain/entities/user.dart';
import 'package:myan_quiz/domain/repositories/user_repository.dart';
import 'package:myan_quiz/domain/usecases/login_with_email.dart';
import 'package:myan_quiz/domain/usecases/login_with_google.dart';

import '../core/error/failures.dart';
import '../domain/usecases/user_login.dart';
import '../domain/usecases/user_register.dart';

class UserProvider extends ChangeNotifier{
  // use case list
  final UserLogin userLogin;
  final LoginWithEmail loginWithEmail;
  final LoginWithGoogle loginWithGoogle;
  final UserRegister userRegister;
  // constructor

  UserProvider({
    required this.userLogin,
    required this.loginWithEmail,
    required this.loginWithGoogle,
    required this.userRegister
  });

  // data repo
  User user = User.sample;

  // methods

  void setUser(User userUpdated){
    user = userUpdated;
    notifyListeners();
  }
  Future<bool> login({required String accessToken, required String fcmToken})async{
    bool status = true;
    final Either<Failure, User> userEither = await userLogin(UserLoginParams(accessToken: accessToken, fcmToken: fcmToken));
    return userEither.fold(
            (failure)  {
          print("UserProvider->login failuer");
          print(failure);
          status = false;
          return status;
        },
            (loggedInUser)  async{
          user = loggedInUser;
          status = true;
          return status;
        }
    );

    /*
    return Future.delayed(Duration(seconds: 5),(){
      if(accessToken == "accessToken"){
        return true;
      }
      else{
        return false;
      }
    });
    final Either<Failure, User> userEither = await userLogin(UserLoginParams(accessToken: accessToken, fcmToken: fcmToken));
    return userEither.fold(
            (failure)  {
          // we don't need to do nothing
          // or may be notify failure type for user login
          print("UserProvider->login failuer");
          print(failure);
          status = false;
          return status;
        },
            (loggedInUser)  async{
          user = loggedInUser;
          status = true;
          return status;
        }
    );

     */
  }


  Future<bool> loginWithEmailPlz({required String email, required String password})async{
    final Either<Failure, User> userEither = await loginWithEmail(LoginWithEmailParams(email: email, password: password));
    return userEither.fold(
            (failure)  {
          print("UserProvider->loginWithEmailPlz failure");
          print(failure);
          return false;
        },
            (loggedInUser)  async{
          user = loggedInUser;
          notifyListeners();
          return true;
        }
    );
  }

  Future<bool> loginWithGooglePlz({required String accessToken})async{
    final Either<Failure, User> userEither = await loginWithGoogle(LoginWithGoogleParams(accessToken: accessToken));
    return userEither.fold(
            (failure)  {
          print("UserProvider->loginWithGooglePlz failure");
          print(failure);
          return false;
        },
            (loggedInUser)  async{
          user = loggedInUser;
          notifyListeners();
          return true;
        }
    );
  }

  Future<bool> userRegisterPlz({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String city,
    required String age,
    required String gender
  })async{
    final Either<Failure, User> userEither = await userRegister(UserRegisterParams(name: name, email: email, password: password, phone: phone, city: city, age: age, gender: gender));
    return userEither.fold(
            (failure)  {
          print("UserProvider->userRegisterPlz failure");
          print(failure);
          return false;
        },
            (loggedInUser)  async{
          user = loggedInUser;
          notifyListeners();
          return true;
        }
    );
  }

}

