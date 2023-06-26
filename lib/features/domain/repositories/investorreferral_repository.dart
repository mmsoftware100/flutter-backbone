

import 'package:base/features/domain/entities/investordashboard.dart';
import 'package:base/features/domain/entities/investorreferral.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';

abstract class InvestorReferralRepository {
  // select crypto list
  Future<Either<Failure, List<InvestorReferral>>> select({required String accessToken});
}
