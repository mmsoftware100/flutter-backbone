

import 'package:base/features/domain/entities/deposit_address.dart';
import 'package:base/features/domain/entities/deposit_transaction.dart';
import 'package:base/features/domain/entities/investordashboard.dart';
import 'package:base/features/domain/entities/investorreferral.dart';
import 'package:base/features/domain/entities/referral.dart';
import 'package:base/features/domain/entities/withdraw_transaction.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';

abstract class ReferralRepository {
  Future<Either<Failure, List<Referral>>> getReferralList({required String accessToken});
}
