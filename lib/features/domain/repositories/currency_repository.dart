import 'package:base/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:base/features/domain/entities/crypto.dart';

abstract class CurrencyRepository {
  // geData
  Future<Either<Failure, Crypto>> getData({required String start,required String limit});
  // me
  Future<Either<Failure, Crypto>> me({required String accessToken});
}
