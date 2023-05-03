
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:myan_quiz/domain/entities/telephone_operator.dart';
import 'package:myan_quiz/domain/repositories/reward_repository.dart';

import '../../core/error/failures.dart';
import '../../core/usercase/usecase.dart';

class GetTelephoneOperators implements UseCase<List<TelephoneOperator>,GetTelephoneOperatorsParams>{
  final RewardRepository rewardRepository;

  GetTelephoneOperators({required this.rewardRepository});

  @override
  Future<Either<Failure, List<TelephoneOperator>>> call(GetTelephoneOperatorsParams params) async{
    //throw UnimplementedError();
    print("GetTelephoneOperators->call");
    return await rewardRepository.selectTelephoneOperators(accessToken: params.accessToken, page: params.page);
  }
}

class GetTelephoneOperatorsParams extends Equatable {
  final String accessToken;
  final int page;

  const GetTelephoneOperatorsParams({required this.accessToken, required this.page});

  @override
  List<Object> get props => [accessToken, page];
}
