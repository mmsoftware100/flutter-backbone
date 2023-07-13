import 'package:base/core/usercase/usecase.dart';
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/domain/entities/deposit_address.dart';
import 'package:base/features/domain/entities/investordashboard.dart';
import 'package:base/features/domain/entities/investorpayment.dart';
import 'package:base/features/domain/entities/investorreferral.dart';
import 'package:base/features/domain/entities/referral.dart';
import 'package:base/features/domain/repositories/crypto_repository.dart';
import 'package:base/features/domain/repositories/investordashboard_repository.dart';
import 'package:base/features/domain/repositories/investorpayment_repository.dart';
import 'package:base/features/domain/repositories/investorreferral_repository.dart';
import 'package:base/features/domain/repositories/referral_repository.dart';
import 'package:base/features/domain/repositories/user_repository.dart';
import 'package:base/features/domain/repositories/wallet_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';
// ok

class GetReferralList implements UseCase<List<Referral>, GetReferralListParams>{
  final ReferralRepository referralRepository;

  GetReferralList({
    required this.referralRepository
  });

  @override
  Future<Either<Failure, List<Referral>>> call(GetReferralListParams params) {
    return referralRepository.getReferralList(accessToken: params.accessToken);
  }
}

class GetReferralListParams extends Equatable{
  final String accessToken;

  const GetReferralListParams({
    required this.accessToken
  });
  @override
  List<Object> get props => [accessToken];
}
