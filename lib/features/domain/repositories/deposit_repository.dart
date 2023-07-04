import 'package:base/core/error/failures.dart';
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/domain/entities/depositdata.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:dartz/dartz.dart';


abstract class DepositRepository {
  // select crypto list
  Future<Either<Failure, DepositData>> AddDepositData({required String accessToken, required String link, required double deposit_amount});
}
