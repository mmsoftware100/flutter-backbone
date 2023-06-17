import 'package:base/core/error/failures.dart';
import 'package:base/core/usercase/usecase.dart';
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/domain/repositories/currency_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CurrencyGetdata implements UseCase<Crypto, CryptoGetdataParams>{
  final CurrencyRepository currencyRepository;

  CurrencyGetdata({
    required this.currencyRepository
  });

  @override
  Future<Either<Failure, Crypto>> call(CryptoGetdataParams params) {
    return currencyRepository.getData( start: params.start,limit: params.limit);
  }
}

class CryptoGetdataParams extends Equatable{
  final String start;
  final String limit;

  const CryptoGetdataParams({
    required this.start,
    required this.limit
  });
  @override
  List<Object> get props => [start,limit];
}
