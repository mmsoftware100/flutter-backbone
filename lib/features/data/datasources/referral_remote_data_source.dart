
import 'package:base/features/data/const/data.dart';
import 'package:base/features/data/models/depositaddress_model.dart';
import 'package:base/features/data/models/deposittransaction_model.dart';
import 'package:base/features/data/models/referral_model.dart';
import 'package:base/features/data/models/withdrawtransaction_model.dart';
import 'package:base/features/domain/entities/deposit_address.dart';
import 'package:base/features/domain/entities/deposit_transaction.dart';
import 'package:base/features/domain/entities/referral.dart';
import 'package:base/features/domain/entities/withdraw_transaction.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/user.dart';
import '../models/user_model.dart';
import 'network_call.dart';

abstract class ReferralRemoteDataSource {
  // referral list
  Future<List<Referral>> getReferralList({required String accessToken});

}

class ReferralRemoteDataSourceImpl implements ReferralRemoteDataSource{
  // final Dio client;
  final NetworkCall networkCall;
  // UserRemoteDataSourceImpl({required this.client});
  ReferralRemoteDataSourceImpl({required this.networkCall});




  @override
  Future<List<Referral>> getReferralList({required String accessToken}) async{
    try{
      String endPoint =  referrallistEndpoint;
      print("WalletRemoteDataSourceImpl->getReferralList");
      print("endpoint is $endPoint");

      Map<String,dynamic> data = {
        // "access_token" : accessToken
      };

      // client.options.headers["Authorization"] = "Bearer $accessToken";
      // final response = await client.post(endPoint, data: data);

      final dataResponse = await networkCall.getRequest( data: data, url: endPoint, bearerToken: accessToken);
      print("WalletRemoteDataSourceImpl->getReferralList response");
      print(dataResponse);
      //print('Response status: ${response.statusCode}');
      //print('Response data: ${response.data}');

      //Map<String, dynamic> dataResponse = response.data;
      try{
        List<dynamic> referralJsonList = dataResponse['data'];
        List<Referral> referrallist = [];
        for(int i=0; i < referralJsonList.length; i++){
          try{
            ReferralModel referralModel = ReferralModel.fromJson(referralJsonList[i]);
            referrallist.add(referralModel.toEntity());
          }
          catch(innerExp, stackTrace){
            print('WalletRemoteDataSourceImpl->getDepositAddressList   serialization exception $innerExp');
            print(stackTrace);
            rethrow;
          }
        }
        return referrallist;
      }catch(innerExp, stackTrace){
        print('WalletRemoteDataSourceImpl->getDepositAddressList   serialization exception $innerExp');
        print(stackTrace);
        rethrow;
      }

    }
    catch(exp, stackTrace){
      print("WalletRemoteDataSourceImpl->getDepositAddressList throw exception");
      if(exp is DioError){
        print("error is DioError");
        print(exp.response);
      }
      print(exp);
      print(stackTrace);
      rethrow;
    }
  }
//
// @override
// Future<User> register({required User user}) async{
//   try{
//     String endPoint =  registerEndpoint;
//     print("UserRemoteDataSourceImpl->register");
//     print("endpoint is $endPoint");
//     var data = {
//       "name" : user.username,
//       "email" : user.email,
//       "password" : user.password,
//     } ; // UserModel.fromEntity(user).toJson();
//
//     if(user.referCode.isNotEmpty){
//       data["refer_code"] = user.referCode;
//     }
//     print(data);
//
//     //final response = await client.post(endPoint, data: data);
//     final dataResponse = await networkCall.postRequest(url: endPoint, data: data);
//     print("UserRemoteDataSourceImpl->register dataResponse");
//     print(dataResponse);
//     //print('Response status: ${response.statusCode}');
//     //print('Response data: ${response.data}');
//
//     //Map<String, dynamic> dataResponse = response.data;
//     try{
//       UserModel userModel = UserModel.fromJson(dataResponse["data"]);
//       return userModel.toEntity();
//     }catch(innerExp, stackTrace){
//       print('UserRemoteDataSourceImpl->register   serialization exception $innerExp');
//       print(stackTrace);
//       rethrow;
//     }
//
//   }
//   catch(exp, stackTrace){
//     print("UserRemoteDataSourceImpl->register throw exception");
//     if(exp is DioError){
//       print("error is DioError");
//       print(exp.response);
//     }
//     print(exp);
//     print(stackTrace);
//     rethrow;
//   }
// }
//
//
// @override
// Future<User> Update({required User user}) async{
//   try{
//     String endPoint =  updateEndpoint;
//     print("UserRemoteDataSourceImpl->update");
//     print("endpoint is $endPoint");
//     // var data = {
//     //   "name" : user.username,
//     //   "email" : user.email,
//     //   "password" : user.password,
//     // } ; //
//
//     var data =  UserModel.fromEntity(user).toJson();
//
//     // if(user.referCode.isNotEmpty){
//     //   data["refer_code"] = user.referCode;
//     // }
//     print(data);
//
//     //final response = await client.post(endPoint, data: data);
//     final dataResponse = await networkCall.postRequest(url: endPoint, data: data);
//     print("UserRemoteDataSourceImpl->update dataResponse");
//     print(dataResponse);
//     //print('Response status: ${response.statusCode}');
//     //print('Response data: ${response.data}');
//
//     //Map<String, dynamic> dataResponse = response.data;
//     try{
//       UserModel userModel = UserModel.fromJson(dataResponse["data"]);
//       return userModel.toEntity();
//     }catch(innerExp, stackTrace){
//       print('UserRemoteDataSourceImpl->update   serialization exception $innerExp');
//       print(stackTrace);
//       rethrow;
//     }
//
//   }
//   catch(exp, stackTrace){
//     print("UserRemoteDataSourceImpl->update throw exception");
//     if(exp is DioError){
//       print("error is DioError");
//       print(exp.response);
//     }
//     print(exp);
//     print(stackTrace);
//     rethrow;
//   }
// }

}