
import 'package:base/core/error/failures.dart';
import 'package:base/features/data/datasources/crypto_remote_data_source.dart';
import 'package:base/features/data/datasources/deposit_remote_data_source.dart';
import 'package:base/features/data/datasources/investordashboard_remote_data_source.dart';
import 'package:base/features/data/datasources/user_remote_data_source.dart';
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/domain/entities/depositdata.dart';
import 'package:base/features/domain/entities/investordashboard.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:base/features/domain/entities/walletinfo.dart';
import 'package:base/features/domain/repositories/crypto_repository.dart';
import 'package:base/features/domain/repositories/deposit_repository.dart';
import 'package:base/features/domain/repositories/investordashboard_repository.dart';
import 'package:base/features/domain/repositories/user_repository.dart';
import 'package:base/features/domain/usecases/add_depositdata.dart';
import 'package:dartz/dartz.dart';

class DepositRepositoryImpl implements DepositRepository{
  final DepositRemoteDataSource depositRemoteDataSource;
  DepositRepositoryImpl({
    required this.depositRemoteDataSource
  });


  @override
  Future<Either<Failure, DepositData>> AddDepositData({required String accessToken, required String link, required double deposit_amount})  async {
    try {
      DepositData depositData = await depositRemoteDataSource.adddepositdata(accessToken: accessToken,link: link,deposit_amount: deposit_amount);
      return Right(depositData);
    }
    catch (exp, stackTrace) {
      // TODO: convert exception to failure with meaningful message
      print("DepositRepositoryImpl->AddDepositData exp");
      print(exp);
      print(stackTrace);
      return Left(GeneralFailure(message: exp.toString()));
    }
  }

  @override
  Future<Either<Failure, List<InvestorDashboard>>> select({required String accessToken}) {
    // TODO: implement select
    throw UnimplementedError();
  }

}