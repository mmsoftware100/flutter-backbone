import 'package:base/core/usercase/usecase.dart';
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/domain/entities/investordashboard.dart';
import 'package:base/features/domain/entities/investorreferral.dart';
import 'package:base/features/domain/repositories/crypto_repository.dart';
import 'package:base/features/domain/repositories/investordashboard_repository.dart';
import 'package:base/features/domain/repositories/investorreferral_repository.dart';
import 'package:base/features/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';


class SelectInvestorReferral implements UseCase<List<InvestorReferral>, SelectInvestorReferralParams>{
  final InvestorReferralRepository investorReferralRepository;

  SelectInvestorReferral({
    required this.investorReferralRepository
  });

  @override
  Future<Either<Failure, List<InvestorReferral>>> call(SelectInvestorReferralParams params) {
    return investorReferralRepository.select(accessToken: params.accessToken);
  }
}

class SelectInvestorReferralParams extends Equatable{
  final String accessToken;

  const SelectInvestorReferralParams({
    required this.accessToken
  });
  @override
  List<Object> get props => [accessToken];
}
