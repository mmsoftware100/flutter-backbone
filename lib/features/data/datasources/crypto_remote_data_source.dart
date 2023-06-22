
import 'package:base/features/data/const/data.dart';
import 'package:base/features/data/models/crypto_model.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/crypto.dart';
import '../../domain/entities/user.dart';
import '../models/user_model.dart';
import 'network_call.dart';

abstract class CryptoRemoteDataSource {
  // register
  Future<List<Crypto>> select({required String accessToken, required int page, required int limit, required String convert});
}

class CryptoRemoteDataSourceImpl implements CryptoRemoteDataSource{
  final NetworkCall networkCall;
  CryptoRemoteDataSourceImpl({required this.networkCall});
  
  @override
  Future<List<Crypto>> select({required String accessToken, required int page, required int limit, required String convert}) async{
    try{
      String endPoint =  currencyEndpoint;
      print("CryptoRemoteDataSourceImpl->login");
      print("endpoint is $endPoint");
      var data = {
        "access_token" : accessToken,
        "page" : page,
        "limit" : limit,
        "convert" : convert
      };
      final dataResponse = await networkCall.getRequest( data: data, url: endPoint);
      print("CryptoRemoteDataSourceImpl->select response");
      print(dataResponse);
      try{
        // get list of crypto json list
        List<dynamic> cryptoJsonList = dataResponse['data'];
        List<Crypto> cryptoList = [];
        for(int i=0; i < cryptoJsonList.length; i++){
          try{
            CryptoModel cryptoModel = CryptoModel.fromJson(cryptoJsonList[i]);
            cryptoList.add(cryptoModel.toEntity());
          }
          catch(innerExp, stackTrace){
            print('CryptoRemoteDataSourceImpl->select   serialization exception $innerExp');
            print(stackTrace);
            rethrow;
          }
        }
        return cryptoList;
      }
      catch(innerExp, stackTrace){
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



}