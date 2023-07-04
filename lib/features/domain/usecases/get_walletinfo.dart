import 'package:base/core/usercase/usecase.dart';
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/domain/entities/walletinfo.dart';
import 'package:base/features/domain/repositories/crypto_repository.dart';
import 'package:base/features/domain/repositories/investordashboard_repository.dart';
import 'package:base/features/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';


class GetWalletInfo implements UseCase<WalletInfo, GetWalletInfoParams>{
  final InvestorDashboardRepository investorDashboardRepository;

  GetWalletInfo({
    required this.investorDashboardRepository
  });

  @override
  Future<Either<Failure, WalletInfo>> call(GetWalletInfoParams params) {
    return investorDashboardRepository.getwalletinfo(accessToken: params.accessToken);
  }
}

class GetWalletInfoParams extends Equatable{
  final String accessToken;

  const GetWalletInfoParams({
    required this.accessToken,
  });
  @override
  List<Object> get props => [accessToken];
}
