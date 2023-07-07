import 'package:base/core/usercase/usecase.dart';
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/domain/entities/dashboard.dart';
import 'package:base/features/domain/entities/deposit_transaction.dart';
import 'package:base/features/domain/entities/walletinfo.dart';
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


class RequestDepositTransaction implements UseCase<DepositTransaction, RequestDepositTransactionParams>{
  final WalletRepository walletRepository;

  RequestDepositTransaction({
    required this.walletRepository
  });

  @override
  Future<Either<Failure, DepositTransaction>> call(RequestDepositTransactionParams params) {
    return walletRepository.requestDepositTransaction(accessToken: params.accessToken);
  }
}

class RequestDepositTransactionParams extends Equatable{
  final String accessToken;

  const RequestDepositTransactionParams({
    required this.accessToken,
  });
  @override
  List<Object> get props => [accessToken];
}
