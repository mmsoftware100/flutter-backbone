import 'package:base/core/usercase/usecase.dart';
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/domain/entities/investordashboard.dart';
import 'package:base/features/domain/entities/investorpayment.dart';
import 'package:base/features/domain/entities/investorreferral.dart';
import 'package:base/features/domain/repositories/crypto_repository.dart';
import 'package:base/features/domain/repositories/investordashboard_repository.dart';
import 'package:base/features/domain/repositories/investorpayment_repository.dart';
import 'package:base/features/domain/repositories/investorreferral_repository.dart';
import 'package:base/features/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';


class SelectInvestorPayment implements UseCase<List<InvestorPayment>, SelectInvestorPaymentParams>{
  final InvestorPaymentRepository investorPaymentRepository;

  SelectInvestorPayment({
    required this.investorPaymentRepository
  });

  @override
  Future<Either<Failure, List<InvestorPayment>>> call(SelectInvestorPaymentParams params) {
    return investorPaymentRepository.select(accessToken: params.accessToken);
  }
}

class SelectInvestorPaymentParams extends Equatable{
  final String accessToken;

  const SelectInvestorPaymentParams({
    required this.accessToken
  });
  @override
  List<Object> get props => [accessToken];
}
