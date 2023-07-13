import 'package:base/core/usercase/usecase.dart';
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/domain/entities/deposit_address.dart';
import 'package:base/features/domain/entities/deposit_transaction.dart';
import 'package:base/features/domain/entities/investordashboard.dart';
import 'package:base/features/domain/entities/investorpayment.dart';
import 'package:base/features/domain/entities/investorreferral.dart';
import 'package:base/features/domain/entities/withdraw_transaction.dart';
import 'package:base/features/domain/repositories/crypto_repository.dart';
import 'package:base/features/domain/repositories/investordashboard_repository.dart';
import 'package:base/features/domain/repositories/investorpayment_repository.dart';
import 'package:base/features/domain/repositories/investorreferral_repository.dart';
import 'package:base/features/domain/repositories/user_repository.dart';
import 'package:base/features/domain/repositories/wallet_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';

// ok
class GetWithdrawTransactionList implements UseCase<List<WithdrawTransaction>, GetWithdrawTransactionListParams>{
  final WalletRepository walletRepository;

  GetWithdrawTransactionList({
    required this.walletRepository
  });

  @override
  Future<Either<Failure, List<WithdrawTransaction>>> call(GetWithdrawTransactionListParams params) {
    return walletRepository.getWithdrawTransactionList(accessToken: params.accessToken);
  }
}

class GetWithdrawTransactionListParams extends Equatable{
  final String accessToken;

  const GetWithdrawTransactionListParams({
    required this.accessToken
  });
  @override
  List<Object> get props => [accessToken];
}
