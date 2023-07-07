import 'package:base/core/usercase/usecase.dart';
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/domain/entities/dashboard.dart';
import 'package:base/features/domain/entities/deposit_transaction.dart';
import 'package:base/features/domain/entities/walletinfo.dart';
import 'package:base/features/domain/entities/withdraw_transaction.dart';
import 'package:base/features/domain/repositories/crypto_repository.dart';
import 'package:base/features/domain/repositories/dashboard_repository.dart';
import 'package:base/features/domain/repositories/investordashboard_repository.dart';
import 'package:base/features/domain/repositories/user_repository.dart';
import 'package:base/features/domain/repositories/wallet_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';


class RequestWithdrawTransaction implements UseCase<WithdrawTransaction, RequestWithdrawTransactionParams>{
  final WalletRepository walletRepository;

  RequestWithdrawTransaction({
    required this.walletRepository
  });

  @override
  Future<Either<Failure, WithdrawTransaction>> call(RequestWithdrawTransactionParams params) {
    return walletRepository.requestWithdrawTransaction(accessToken:  params.accessToken);
  }
}

class RequestWithdrawTransactionParams extends Equatable{
  final String accessToken;

  const RequestWithdrawTransactionParams({
    required this.accessToken,
  });
  @override
  List<Object> get props => [accessToken];
}
