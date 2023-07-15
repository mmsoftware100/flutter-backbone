

import 'package:base/features/domain/entities/deposit_address.dart';
import 'package:base/features/domain/entities/deposit_transaction.dart';
import 'package:base/features/domain/entities/investordashboard.dart';
import 'package:base/features/domain/entities/investorreferral.dart';
import 'package:base/features/domain/entities/withdraw_transaction.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';

abstract class WalletRepository {
  Future<Either<Failure, List<DepositAddress>>> getDepositAddressList({required String accessToken});
  Future<Either<Failure, List<DepositTransaction>>> getDepositTransactionList({required String accessToken});
  Future<Either<Failure, List<WithdrawTransaction>>> getWithdrawTransactionList({required String accessToken});
  Future<Either<Failure, DepositTransaction>> requestDepositTransaction({required String accessToken, required String link, required double depositAmount});
  Future<Either<Failure, WithdrawTransaction>> requestWithdrawTransaction({required String accessToken, required String withdrawAddress, required double withdrawAmount});
}
