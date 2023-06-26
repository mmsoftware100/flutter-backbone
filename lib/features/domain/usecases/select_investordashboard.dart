import 'package:base/core/usercase/usecase.dart';
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/domain/entities/investordashboard.dart';
import 'package:base/features/domain/repositories/crypto_repository.dart';
import 'package:base/features/domain/repositories/investordashboard_repository.dart';
import 'package:base/features/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';


class SelectInvestorDashboard implements UseCase<List<InvestorDashboard>, SelectInvestorDashboardParams>{
  final InvestorDashboardRepository investorDashboardRepository;

  SelectInvestorDashboard({
    required this.investorDashboardRepository
  });

  @override
  Future<Either<Failure, List<InvestorDashboard>>> call(SelectInvestorDashboardParams params) {
    return investorDashboardRepository.select(accessToken: params.accessToken);
  }
}

class SelectInvestorDashboardParams extends Equatable{
  final String accessToken;

  const SelectInvestorDashboardParams({
    required this.accessToken
  });
  @override
  List<Object> get props => [accessToken];
}
