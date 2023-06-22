import 'package:base/core/error/failures.dart';
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:dartz/dartz.dart';


abstract class CryptoRepository {
  // select crypto list
  Future<Either<Failure, List<Crypto>>> select({required String accessToken, required int page, required int limit, required String convert});
}
