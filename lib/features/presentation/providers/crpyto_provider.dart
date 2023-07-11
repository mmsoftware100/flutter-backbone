

import 'package:base/core/error/failures.dart';
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:base/features/domain/usecases/select_crypto.dart';
import 'package:base/features/domain/usecases/user_register.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../data/const/data.dart';
import '../../data/datasources/local_storage.dart';
import '../../domain/usecases/user_login.dart';
class CryptoProvider extends ChangeNotifier {
  // use case
  // final SelectCrypto selectCrypto;

  /*
  CryptoProvider({
    // required this.selectCrypto
  });

   */


  List<Crypto> cryptoList = [];

  Future<String> selectCryptoPlz({
    required String accessToken,
    required int page,
    required int limit,
    required String convert
  })async{
    /*
    final Either<Failure, List<Crypto>> cryptoListEither = await selectCrypto(SelectCryptoParams(
        accessToken: accessToken,
        page: page,
        limit: limit,
        convert: convert
    ));
    return cryptoListEither.fold(
            (failure)  {
              // specify failure
              print("CryptoProvider->selectCryptoPlz->failure");
              print(failure);
              notifyListeners();
              return failure.toString();
            },
            (cryptoListUpdated)  async{
              print("CryptoProvider->selectCryptoPlz->userData");
              cryptoList = cryptoListUpdated;
              notifyListeners();
              return  "success";
            }
    );

     */

    throw UnImplementedFailure();
  }





}
