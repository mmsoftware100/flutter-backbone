
import 'package:base/features/data/const/data.dart';
import 'package:base/features/data/models/crypto_model.dart';
import 'package:base/features/domain/entities/dashboard.dart';
import 'package:base/features/domain/entities/depositdata.dart';
import 'package:base/features/domain/entities/walletinfo.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/crypto.dart';
import '../../domain/entities/user.dart';
import 'network_call.dart';

abstract class DashboardRemoteDataSource {
  // register
  Future<Dashboard> getDashboard({required String accessToken});
}



class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource{
  final NetworkCall networkCall;
  DashboardRemoteDataSourceImpl({required this.networkCall});


  @override
  Future<Dashboard> getDashboard({required String accessToken}) async{
    try{
      String endPoint =  currencyEndpoint;
      print("DashboardRemoteDataSourceImpl->getDashboard");
      print("endpoint is $endPoint");
      final dataResponse = await networkCall.getRequest( data: data, url: endPoint, headers: headers);
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
