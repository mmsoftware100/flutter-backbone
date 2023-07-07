import 'package:base/core/error/failures.dart';
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/domain/entities/dashboard.dart';
import 'package:base/features/domain/entities/depositdata.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:dartz/dartz.dart';


abstract class DashboardRepository {
  // select crypto list
  Future<Either<Failure, Dashboard>> GetDashboard({required String accessToken});
}
