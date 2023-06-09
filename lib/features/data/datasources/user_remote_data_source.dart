
import 'package:base/features/data/const/data.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/user.dart';
import '../models/user_model.dart';
import 'network_call.dart';

abstract class UserRemoteDataSource {
  // register
  Future<User> register({required String password, required String email, required String name});
  // login
  Future<User> login({required String email, required String password});
  // me
  Future<User> me({required String accessToken});
}

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
      }
      print(exp);
      print(stackTrace);
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
  Future<User> register({required String password, required String email, required String name}) async{
    try{
      String endPoint =  registerEndpoint;
      print("UserRemoteDataSourceImpl->register");
      print("endpoint is $endPoint");
      var data = {
        "email" : email,
        "password" : password,
        "name" : name,
        "password_confirm" : password
      };
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
      }
      print(exp);
      print(stackTrace);
      rethrow;
    }
  }

}