import 'package:base/core/usercase/usecase.dart';
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/domain/repositories/crypto_repository.dart';
import 'package:base/features/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';


class SelectCrypto implements UseCase<List<Crypto>, SelectCryptoParams>{
  final CryptoRepository cryptoRepository;

  SelectCrypto({
    required this.cryptoRepository
  });

  @override
  Future<Either<Failure, List<Crypto>>> call(SelectCryptoParams params) {
    return cryptoRepository.select(accessToken: params.accessToken, page: params.page, limit: params.limit, convert: params.convert);
  }
}

class SelectCryptoParams extends Equatable{
  final String accessToken;
  final int page;
  final int limit;
  final String convert;

  const SelectCryptoParams({
    required this.accessToken,
    required this.page,
    required this.limit,
    required this.convert
  });
  @override
  List<Object> get props => [accessToken, page, limit, convert];
}
