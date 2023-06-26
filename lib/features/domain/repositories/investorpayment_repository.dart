import 'package:base/features/domain/entities/investordashboard.dart';
import 'package:base/features/domain/entities/investorpayment.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';

abstract class InvestorPaymentRepository {
  // select crypto list
  Future<Either<Failure, List<InvestorPayment>>> select({required String accessToken});
}