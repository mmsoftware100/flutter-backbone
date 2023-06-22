
import 'package:base/core/error/failures.dart';
import 'package:base/features/data/datasources/crypto_remote_data_source.dart';
import 'package:base/features/data/datasources/user_remote_data_source.dart';
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:base/features/domain/repositories/crypto_repository.dart';
import 'package:base/features/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class CryptoRepositoryImpl implements CryptoRepository{
  final CryptoRemoteDataSource cryptoRemoteDataSource;
  CryptoRepositoryImpl({
    required this.cryptoRemoteDataSource
  });


  @override
  Future<Either<Failure, List<Crypto>>> select({required String accessToken, required int page, required int limit, required String convert})  async {
    try {
      List<Crypto> cryptoList = await cryptoRemoteDataSource.select(accessToken: accessToken, page: page, limit: limit, convert: convert);
      return Right(cryptoList);
    }
    catch (exp, stackTrace) {
      // TODO: convert exception to failure with meaningful message
      print("CryptoRepositoryImpl->select exp");
      print(exp);
      print(stackTrace);
      return Left(GeneralFailure(message: exp.toString()));
    }
  }

}