import 'package:base/core/usercase/usecase.dart';
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/domain/entities/dashboard.dart';
import 'package:base/features/domain/entities/walletinfo.dart';
import 'package:base/features/domain/repositories/crypto_repository.dart';
import 'package:base/features/domain/repositories/dashboard_repository.dart';
import 'package:base/features/domain/repositories/investordashboard_repository.dart';
import 'package:base/features/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';

// ok
class GetDashboard implements UseCase<Dashboard, GetDashboardParams>{
  final DashboardRepository dashboardRepository;

  GetDashboard({
    required this.dashboardRepository
  });

  @override
  Future<Either<Failure, Dashboard>> call(GetDashboardParams params) {
    return dashboardRepository.GetDashboard(accessToken: params.accessToken);
  }
}

class GetDashboardParams extends Equatable{
  final String accessToken;

  const GetDashboardParams({
    required this.accessToken,
  });
  @override
  List<Object> get props => [accessToken];
}
