
import 'package:base/core/error/failures.dart';
import 'package:base/features/data/datasources/crypto_remote_data_source.dart';
import 'package:base/features/data/datasources/dashboard_remote_data_source.dart';
import 'package:base/features/data/datasources/deposit_remote_data_source.dart';
import 'package:base/features/data/datasources/investordashboard_remote_data_source.dart';
import 'package:base/features/data/datasources/user_remote_data_source.dart';
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/domain/entities/dashboard.dart';
import 'package:base/features/domain/entities/depositdata.dart';
import 'package:base/features/domain/entities/investordashboard.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:base/features/domain/entities/walletinfo.dart';
import 'package:base/features/domain/repositories/crypto_repository.dart';
import 'package:base/features/domain/repositories/dashboard_repository.dart';
import 'package:base/features/domain/repositories/deposit_repository.dart';
import 'package:base/features/domain/repositories/investordashboard_repository.dart';
import 'package:base/features/domain/repositories/user_repository.dart';
import 'package:base/features/domain/usecases/add_depositdata.dart';
import 'package:dartz/dartz.dart';

class DashboardRepositoryImpl implements DashboardRepository{
  final DashboardRemoteDataSource dashboardRemoteDataSource;
  DashboardRepositoryImpl({
    required this.dashboardRemoteDataSource
  });


  @override
  Future<Either<Failure, Dashboard>> GetDashboard({required String accessToken})  async {
    try {
      Dashboard depositData = await dashboardRemoteDataSource.getDashboard(accessToken: accessToken);
      return Right(depositData);
    }
    catch (exp, stackTrace) {
      // TODO: convert exception to failure with meaningful message
      print("DepositRepositoryImpl->GetDepositAddressList exp");
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