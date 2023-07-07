
import 'package:base/features/data/const/data.dart';
import 'package:base/features/data/models/depositaddress_model.dart';
import 'package:base/features/data/models/deposittransaction_model.dart';
import 'package:base/features/data/models/withdrawtransaction_model.dart';
import 'package:base/features/domain/entities/deposit_address.dart';
import 'package:base/features/domain/entities/deposit_transaction.dart';
import 'package:base/features/domain/entities/withdraw_transaction.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/user.dart';
import '../models/user_model.dart';
import 'network_call.dart';

abstract class WalletRemoteDataSource {
  // deposit address list
  Future<List<DepositAddress>> getDepositAddressList({required String accessToken});

  // deposit transaction list
  Future<List<DepositTransaction>> getDepositTransactionList({required String accessToken});


  // withdraw transaction list
  Future<List<WithdrawTransaction>> getWithdrawTransactionList({required String accessToken});

  //Request Deposit Transaction
  Future<DepositTransaction> RequestDepositTransaction({required String  accessToken});

  //Request Withdraw Transaction
  Future<WithdrawTransaction> RequestWithdrawTransaction({required String  accessToken});

}

class WalletRemoteDataSourceImpl implements WalletRemoteDataSource{
  // final Dio client;
  final NetworkCall networkCall;
  // UserRemoteDataSourceImpl({required this.client});
  WalletRemoteDataSourceImpl({required this.networkCall});




  @override
  Future<List<DepositAddress>> getDepositAddressList({required String accessToken}) async{
    try{
      String endPoint =  depositaddresslistEndpoint;
      print("WalletRemoteDataSourceImpl->getDepositAddressList");
      print("endpoint is $endPoint");

      Map<String,dynamic> data = {
        // "access_token" : accessToken
      };

      // client.options.headers["Authorization"] = "Bearer $accessToken";
      // final response = await client.post(endPoint, data: data);

      final dataResponse = await networkCall.getRequest( data: data, url: endPoint, bearerToken: accessToken);
      print("WalletRemoteDataSourceImpl->getDepositAddressList response");
      print(dataResponse);
      //print('Response status: ${response.statusCode}');
      //print('Response data: ${response.data}');

      //Map<String, dynamic> dataResponse = response.data;
      try{
        List<dynamic> depositaddressJsonList = dataResponse['data'];
        List<DepositAddress> depositaddresslist = [];
        for(int i=0; i < depositaddressJsonList.length; i++){
          try{
            DepositAddressModel depositAddress = DepositAddressModel.fromJson(depositaddressJsonList[i]);
            depositaddresslist.add(depositAddress.toEntity());
          }
          catch(innerExp, stackTrace){
            print('WalletRemoteDataSourceImpl->getDepositAddressList   serialization exception $innerExp');
            print(stackTrace);
            rethrow;
          }
        }
        return depositaddresslist;
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

  @override
  Future<List<DepositTransaction>> getDepositTransactionList({required String accessToken}) async{
    try{
      String endPoint =  deposittransactionlistEndpoint;
      print("WalletRemoteDataSourceImpl->getDepositTransactionList");
      print("endpoint is $endPoint");

      Map<String,dynamic> data = {
        // "access_token" : accessToken
      };

      // client.options.headers["Authorization"] = "Bearer $accessToken";
      // final response = await client.post(endPoint, data: data);

      final dataResponse = await networkCall.getRequest( data: data, url: endPoint, bearerToken: accessToken);
      print("WalletRemoteDataSourceImpl->getDepositTransactionList response");
      print(dataResponse);
      //print('Response status: ${response.statusCode}');
      //print('Response data: ${response.data}');

      //Map<String, dynamic> dataResponse = response.data;
      try{
        List<dynamic> deposittransactionJsonList = dataResponse['data'];
        List<DepositTransaction> deposittransactionlist = [];
        for(int i=0; i < deposittransactionJsonList.length; i++){
          try{
            DepositTransactionModel depositTransactionModel = DepositTransactionModel.fromJson(deposittransactionJsonList[i]);
            deposittransactionlist.add(depositTransactionModel.toEntity());
          }
          catch(innerExp, stackTrace){
            print('WalletRemoteDataSourceImpl->getDepositTransactionList   serialization exception $innerExp');
            print(stackTrace);
            rethrow;
          }
        }
        return deposittransactionlist;
      }catch(innerExp, stackTrace){
        print('WalletRemoteDataSourceImpl->getDepositTransactionList   serialization exception $innerExp');
        print(stackTrace);
        rethrow;
      }

    }
    catch(exp, stackTrace){
      print("WalletRemoteDataSourceImpl->getDepositTransactionList throw exception");
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
  Future<List<WithdrawTransaction>> getWithdrawTransactionList({required String accessToken})async {
    try{
      String endPoint =  withdrawtransactionlistEndpoint;
      print("WalletRemoteDataSourceImpl->getWithdrawTransactionList");
      print("endpoint is $endPoint");

      Map<String,dynamic> data = {
        // "access_token" : accessToken
      };

      // client.options.headers["Authorization"] = "Bearer $accessToken";
      // final response = await client.post(endPoint, data: data);

      final dataResponse = await networkCall.getRequest( data: data, url: endPoint, bearerToken: accessToken);
      print("WalletRemoteDataSourceImpl->getWithdrawTransactionList response");
      print(dataResponse);
      //print('Response status: ${response.statusCode}');
      //print('Response data: ${response.data}');

      //Map<String, dynamic> dataResponse = response.data;
      try{
        List<dynamic> withdrawtransactionJsonList = dataResponse['data'];
        List<WithdrawTransaction> withdrawtransactionlist = [];
        for(int i=0; i < withdrawtransactionJsonList.length; i++){
          try{
            WithdrawTransactionModel withdrawTransactionModel = WithdrawTransactionModel.fromJson(withdrawtransactionJsonList[i]);
            withdrawtransactionlist.add(withdrawTransactionModel.toEntity());
          }
          catch(innerExp, stackTrace){
            print('WalletRemoteDataSourceImpl->getWithdrawTransactionList   serialization exception $innerExp');
            print(stackTrace);
            rethrow;
          }
        }
        return withdrawtransactionlist;
      }catch(innerExp, stackTrace){
        print('WalletRemoteDataSourceImpl->getWithdrawTransactionList   serialization exception $innerExp');
        print(stackTrace);
        rethrow;
      }

    }
    catch(exp, stackTrace){
      print("WalletRemoteDataSourceImpl->getWithdrawTransactionList throw exception");
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
  Future<DepositTransaction> RequestDepositTransaction({required String accessToken}) async {
      try{
        String endPoint =  deposittransactionEndpoint;
        print("WalletRemoteDataSource->RequestDepositTransaction");
        print("endpoint is $endPoint");

        Map<String,dynamic> data = {
          // "access_token" : accessToken
        };

        // client.options.headers["Authorization"] = "Bearer $accessToken";
        // final response = await client.post(endPoint, data: data);

        final dataResponse = await networkCall.postRequest( data: data, url: endPoint, bearerToken: accessToken);
        print("WalletRemoteDataSource->RequestDepositTransaction response");
        print(dataResponse);
        //print('Response status: ${response.statusCode}');
        //print('Response data: ${response.data}');

        //Map<String, dynamic> dataResponse = response.data;
        try{
          DepositTransactionModel depositTransaction = DepositTransactionModel.fromJson(dataResponse["data"]);
          return depositTransaction.toEntity();
        }catch(innerExp, stackTrace){
          print('WalletRemoteDataSource->RequestDepositTransaction   serialization exception $innerExp');
          print(stackTrace);
          rethrow;
        }

      }
      catch(exp, stackTrace){
        print("WalletRemoteDataSource->RequestDepositTransaction throw exception");
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
  Future<WithdrawTransaction> RequestWithdrawTransaction({required String accessToken}) async {
    try{
      String endPoint =  withdrawtransactionEndpoint;
      print("WalletRemoteDataSource->RequestWithdrawTransaction");
      print("endpoint is $endPoint");

      Map<String,dynamic> data = {
        // "access_token" : accessToken
      };

      // client.options.headers["Authorization"] = "Bearer $accessToken";
      // final response = await client.post(endPoint, data: data);

      final dataResponse = await networkCall.postRequest( data: data, url: endPoint, bearerToken: accessToken);
      print("WalletRemoteDataSource->RequestWithdrawTransaction response");
      print(dataResponse);
      //print('Response status: ${response.statusCode}');
      //print('Response data: ${response.data}');

      //Map<String, dynamic> dataResponse = response.data;
      try{
        WithdrawTransactionModel withdrawTransactionModel = WithdrawTransactionModel.fromJson(dataResponse["data"]);
        return withdrawTransactionModel.toEntity();
      }catch(innerExp, stackTrace){
        print('WalletRemoteDataSource->RequestWithdrawTransaction   serialization exception $innerExp');
        print(stackTrace);
        rethrow;
      }

    }
    catch(exp, stackTrace){
      print("WalletRemoteDataSource->RequestWithdrawTransaction throw exception");
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