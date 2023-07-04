


import 'package:base/features/domain/entities/investordashboard.dart';
import 'package:base/features/domain/entities/walletinfo.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';

abstract class InvestorDashboardRepository {
  // select crypto list
  Future<Either<Failure, List<InvestorDashboard>>> select({required String accessToken});
// select wallet info
  Future<Either<Failure, WalletInfo>> getwalletinfo({required String accessToken});
}
