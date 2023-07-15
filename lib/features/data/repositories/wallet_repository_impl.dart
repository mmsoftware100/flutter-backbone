
import 'package:base/core/error/failures.dart';
import 'package:base/features/data/datasources/crypto_remote_data_source.dart';
import 'package:base/features/data/datasources/deposit_remote_data_source.dart';
import 'package:base/features/data/datasources/investordashboard_remote_data_source.dart';
import 'package:base/features/data/datasources/user_remote_data_source.dart';
import 'package:base/features/data/datasources/wallet_remote_data_source.dart';
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/domain/entities/deposit_address.dart';
import 'package:base/features/domain/entities/deposit_transaction.dart';
import 'package:base/features/domain/entities/depositdata.dart';
import 'package:base/features/domain/entities/investordashboard.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:base/features/domain/entities/walletinfo.dart';
import 'package:base/features/domain/entities/withdraw_transaction.dart';
import 'package:base/features/domain/repositories/crypto_repository.dart';
import 'package:base/features/domain/repositories/deposit_repository.dart';
import 'package:base/features/domain/repositories/investordashboard_repository.dart';
import 'package:base/features/domain/repositories/user_repository.dart';
import 'package:base/features/domain/usecases/add_depositdata.dart';
import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';

import '../../domain/repositories/wallet_repository.dart';

class WalletRepositoryImpl implements WalletRepository{
  final WalletRemoteDataSource walletRemoteDataSource;
  WalletRepositoryImpl({
    required this.walletRemoteDataSource
  });





  @override
  Future<Either<Failure, List<DepositAddress>>> getDepositAddressList({required String accessToken}) async {
    try {
      List<DepositAddress> depositDatalist = await walletRemoteDataSource.getDepositAddressList(accessToken: accessToken);
      return Right(depositDatalist);
    }
    catch (exp, stackTrace) {
      // TODO: convert exception to failure with meaningful message
      print("WalletRepositoryImpl->getDepositAddressList exp");
      print(exp);
      print(stackTrace);
      return Left(GeneralFailure(message: exp.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DepositTransaction>>> getDepositTransactionList({required String accessToken}) async{
    try {
      List<DepositTransaction> depositTranlist = await walletRemoteDataSource.getDepositTransactionList(accessToken: accessToken);
      return Right(depositTranlist);
    }
    catch (exp, stackTrace) {
      // TODO: convert exception to failure with meaningful message
      print("WalletRepositoryImpl->getDepositTransactionList exp");
      print(exp);
      print(stackTrace);
      return Left(GeneralFailure(message: exp.toString()));
    }
  }

  @override
  Future<Either<Failure, List<WithdrawTransaction>>> getWithdrawTransactionList({required String accessToken}) async {
    try {
      List<WithdrawTransaction> withdrawtranlist = await walletRemoteDataSource.getWithdrawTransactionList(accessToken: accessToken);
      return Right(withdrawtranlist);
    }
    catch (exp, stackTrace) {
      // TODO: convert exception to failure with meaningful message
      print("WalletRepositoryImpl->getDepositTransactionList exp");
      print(exp);
      print(stackTrace);
      return Left(GeneralFailure(message: exp.toString()));
    }
  }

  @override
  Future<Either<Failure, DepositTransaction>> requestDepositTransaction({required String accessToken, required String link, required double depositAmount}) async {
    try{
      DepositTransaction depositTransaction =  await walletRemoteDataSource.requestDepositTransaction(accessToken: accessToken, link: link, depositAmount: depositAmount);
      return Right(depositTransaction);
    }
    catch(exp, stackTrace){
      // TODO: convert exception to failure with meaningful message
      print("WalletRepositoryImpl->requestDepositTransaction exp");
      print(exp);
      print(stackTrace);
      return Left(GeneralFailure(message: exp.toString()));
    }
  }

  @override
  Future<Either<Failure, WithdrawTransaction>> requestWithdrawTransaction({required String accessToken, required String withdrawAddress, required double withdrawAmount}) async {
    try{
      WithdrawTransaction withdrawTransaction =  await walletRemoteDataSource.requestWithdrawTransaction(accessToken: accessToken, withdrawAddress: withdrawAddress, withdrawAmount: withdrawAmount);
      return Right(withdrawTransaction);
    }
    catch(exp, stackTrace){
      // TODO: convert exception to failure with meaningful message
      print("WalletRepositoryImpl->requestWithdrawTransaction exp");
      print(exp);
      print(stackTrace);
      return Left(GeneralFailure(message: exp.toString()));
    }
  }

}