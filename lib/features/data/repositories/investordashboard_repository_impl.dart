
import 'package:base/core/error/failures.dart';
import 'package:base/features/data/datasources/crypto_remote_data_source.dart';
import 'package:base/features/data/datasources/investordashboard_remote_data_source.dart';
import 'package:base/features/data/datasources/user_remote_data_source.dart';
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/domain/entities/investordashboard.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:base/features/domain/entities/walletinfo.dart';
import 'package:base/features/domain/repositories/crypto_repository.dart';
import 'package:base/features/domain/repositories/investordashboard_repository.dart';
import 'package:base/features/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class InvestorDashboardImpl implements InvestorDashboardRepository{
  final InvestorDashboardRemoteDataSource investorDashboardRemoteDataSource;
  InvestorDashboardImpl({
    required this.investorDashboardRemoteDataSource
  });


  @override
  Future<Either<Failure, WalletInfo>> getwalletinfo({required String accessToken})  async {
    try {
      WalletInfo walletInfo = await investorDashboardRemoteDataSource.getwalletinfo(accessToken: accessToken);
      return Right(walletInfo);
    }
    catch (exp, stackTrace) {
      // TODO: convert exception to failure with meaningful message
      print("InvestorDashboardImpl->getwalletinfo exp");
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