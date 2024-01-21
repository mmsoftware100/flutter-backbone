
import 'dart:convert';

import 'package:base/core/error/exceptions.dart';
import 'package:base/features/data/const/data.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/user.dart';
import '../models/user_model.dart';
import 'network_call.dart';

abstract class UserRemoteDataSource {
  // register
  Future<User> register({required User user});
  // login
  Future<User> login({required String email, required String password});
  // me
  Future<User> me({required String accessToken});
  //Update
  Future<User> Update({required User user});
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final NetworkCall networkCall;

  UserRemoteDataSourceImpl({required this.networkCall});

  @override
  Future<User> Update({required User user}) {
    // TODO: implement Update
    throw UnimplementedError();
  }

  @override
  Future<User> login({required String email, required String password}) async{
    Map<String, dynamic> body = {
      "email": email,
      "password": password
    };
    try{
      dynamic responseData = await networkCall.postRequest(url: "url", data: body);
      String responseString = responseData.body;
      Map<String, dynamic> responseObj = jsonDecode(responseString);
      Map<String, dynamic> userObj =  responseObj["data"];
      UserModel userModel = UserModel.fromJson(userObj);
      User user = userModel.toEntity();
      return user;
    }
    catch(exp){
      rethrow;
    }



  }

  @override
  Future<User> me({required String accessToken}) {
    // TODO: implement me
    throw UnimplementedError();
  }

  @override
  Future<User> register({required User user}) {
    // TODO: implement register
    throw UnimplementedError();
  }

}

/*
class UserRemoteDataSourceImpl implements UserRemoteDataSource{
  // final Dio client;
  final NetworkCall networkCall;
  // UserRemoteDataSourceImpl({required this.client});
  UserRemoteDataSourceImpl({required this.networkCall});

  @override
  Future<User> login({required String email, required String password}) async{
    try{
      String endPoint =  loginEndpoint;
      print("UserRemoteDataSourceImpl->login");
      print("endpoint is $endPoint");
      var data = {
        "email" : email,
        "password" : password
      };

      //final response = await client.post(endPoint, data: data);
      final dataResponse = await networkCall.postRequest( data: data, url: endPoint);
      print("UserRemoteDataSourceImpl->login response");
      print(dataResponse);
      print(dataResponse.runtimeType);
      //print('Response status: ${response.statusCode}');
      //print('Response data: ${response.data}');

      // Map<String, dynamic> dataResponse = response.data;
      try{
        UserModel userModel = UserModel.fromJson(dataResponse["data"]);
        userModel.accessToken = dataResponse["data"]["access_token"];
        print('Wallet address is--->');
        print(dataResponse["data"]["wallet_address"]);
        return userModel.toEntity();
      }catch(innerExp, stackTrace){
        print('UserRemoteDataSourceImpl->login   serialization exception $innerExp');
        print(stackTrace);
        rethrow;
      }

    }
    catch(exp, stackTrace){
      print("UserRemoteDataSourceImpl->login throw exception");
      // TODO: http response body has to caught in LOG at network CALL
      if(exp is DioError){
        print("error is DioError");
        print(exp.response);
        throw GeneralException(message: exp.response.toString());
      }
      print(exp);
      print(stackTrace);
      // need to throw meaningful exception
      //throw GeneralException(message: exp.toString());
      rethrow;
    }
  }

  @override
  Future<User> me({required String accessToken}) async{
    try{
      String endPoint =  meEndpoint;
      print("UserRemoteDataSourceImpl->me");
      print("endpoint is $endPoint");

      Map<String,dynamic> data = {
        // "access_token" : accessToken
      };

      // client.options.headers["Authorization"] = "Bearer $accessToken";
      // final response = await client.post(endPoint, data: data);

      final dataResponse = await networkCall.postRequest( data: data, url: endPoint, bearerToken: accessToken);
      print("UserRemoteDataSourceImpl->me response");
      print(dataResponse);
      //print('Response status: ${response.statusCode}');
      //print('Response data: ${response.data}');

      //Map<String, dynamic> dataResponse = response.data;
      try{
        UserModel userModel = UserModel.fromJson(dataResponse["data"]);
        return userModel.toEntity();
      }catch(innerExp, stackTrace){
        print('UserRemoteDataSourceImpl->me   serialization exception $innerExp');
        print(stackTrace);
        rethrow;
      }

    }
    catch(exp, stackTrace){
      print("UserRemoteDataSourceImpl->me throw exception");
      if(exp is DioError){
        print("error is DioError");
        print(exp.response);
      }
      print(exp);
      print(stackTrace);
      rethrow;
    }
  }

  @override
  Future<User> register({required User user}) async{
    try{
      String endPoint =  registerEndpoint;
      print("UserRemoteDataSourceImpl->register");
      print("endpoint is $endPoint");
      var data = {
        "name" : user.username,
        "email" : user.email,
        "password" : user.password,
      } ; // UserModel.fromEntity(user).toJson();

      if(user.referCode.isNotEmpty){
        data["refer_code"] = user.referCode;
      }
      print(data);

      //final response = await client.post(endPoint, data: data);
      final dataResponse = await networkCall.postRequest(url: endPoint, data: data);
      print("UserRemoteDataSourceImpl->register dataResponse");
      print(dataResponse);
      //print('Response status: ${response.statusCode}');
      //print('Response data: ${response.data}');

      //Map<String, dynamic> dataResponse = response.data;
      try{
        UserModel userModel = UserModel.fromJson(dataResponse["data"]);
        return userModel.toEntity();
      }catch(innerExp, stackTrace){
        print('UserRemoteDataSourceImpl->register   serialization exception $innerExp');
        print(stackTrace);
        rethrow;
      }

    }
    catch(exp, stackTrace){
      print("UserRemoteDataSourceImpl->register throw exception");
      if(exp is DioError){
        print("error is DioError");
        print(exp.response);
        print("response runtime type is ");
        print(exp.response.runtimeType);
        // throw GeneralException(message: exp.response.toString());
        throw GeneralException(message: "Something Wrong!!! Please Check Network and Try Again");
      }
      print(exp);
      print(stackTrace);
      rethrow;
    }
  }


  @override
  Future<User> Update({required User user}) async{
    try{
      String endPoint =  updateEndpoint;
      print("UserRemoteDataSourceImpl->update");
      print("endpoint is $endPoint");
      print(user.wallet_address);
      // var data = {
      //   "name" : user.username,
      //   "email" : user.email,
      //   "password" : user.password,
      // } ; //

      var data =  UserModel.fromEntity(user).toJson();

      // if(user.referCode.isNotEmpty){
      //   data["refer_code"] = user.referCode;
      // }
      print(data);

      //final response = await client.post(endPoint, data: data);
      final dataResponse = await networkCall.postRequest(url: endPoint, data: data);
      print("UserRemoteDataSourceImpl->update dataResponse");
      print(dataResponse);
      //print('Response status: ${response.statusCode}');
      //print('Response data: ${response.data}');

      //Map<String, dynamic> dataResponse = response.data;
      try{
        UserModel userModel = UserModel.fromJson(dataResponse["data"]);
        return userModel.toEntity();
      }catch(innerExp, stackTrace){
        print('UserRemoteDataSourceImpl->update   serialization exception $innerExp');
        print(stackTrace);
        rethrow;
      }

    }
    catch(exp, stackTrace){
      print("UserRemoteDataSourceImpl->update throw exception");
      if(exp is DioError){
        print("error is DioError");
        print(exp.response);
      }
      print(exp);
      print(stackTrace);
      rethrow;
    }
  }

}

 */