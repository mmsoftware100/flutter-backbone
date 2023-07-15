
import 'package:base/core/error/failures.dart';
import 'package:base/features/data/datasources/crypto_remote_data_source.dart';
import 'package:base/features/data/datasources/dashboard_remote_data_source.dart';
import 'package:base/features/data/datasources/deposit_remote_data_source.dart';
import 'package:base/features/data/datasources/investordashboard_remote_data_source.dart';
import 'package:base/features/data/datasources/referral_remote_data_source.dart';
import 'package:base/features/data/datasources/user_remote_data_source.dart';
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/domain/entities/dashboard.dart';
import 'package:base/features/domain/entities/depositdata.dart';
import 'package:base/features/domain/entities/investordashboard.dart';
import 'package:base/features/domain/entities/referral.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:base/features/domain/entities/walletinfo.dart';
import 'package:base/features/domain/repositories/crypto_repository.dart';
import 'package:base/features/domain/repositories/dashboard_repository.dart';
import 'package:base/features/domain/repositories/deposit_repository.dart';
import 'package:base/features/domain/repositories/investordashboard_repository.dart';
import 'package:base/features/domain/repositories/referral_repository.dart';
import 'package:base/features/domain/repositories/user_repository.dart';
import 'package:base/features/domain/usecases/add_depositdata.dart';
import 'package:dartz/dartz.dart';

class ReferralRepositoryImpl implements ReferralRepository{
  final ReferralRemoteDataSource referralRemoteDataSource;
  ReferralRepositoryImpl({
    required this.referralRemoteDataSource
  });



  @override
  Future<Either<Failure, List<Referral>>> getReferralList({required String accessToken}) async{
    try {
      List<Referral> referralList = await referralRemoteDataSource.getReferralList(accessToken: accessToken);
      return Right(referralList);
    }
    catch (exp, stackTrace) {
      // TODO: convert exception to failure with meaningful message
      print("ReferralRepositoryImpl->getReferralList exp");
      print(exp);
      print(stackTrace);
      return Left(GeneralFailure(message: exp.toString()));
    }
  }

}