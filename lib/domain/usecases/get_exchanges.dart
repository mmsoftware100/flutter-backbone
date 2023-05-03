
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:myan_quiz/domain/entities/bill_exchange.dart';
import 'package:myan_quiz/domain/entities/telephone_operator.dart';
import 'package:myan_quiz/domain/repositories/reward_repository.dart';

import '../../core/error/failures.dart';
import '../../core/usercase/usecase.dart';

class GetExchanges implements UseCase<List<BillExchange>,GetExchangesParams>{
  final RewardRepository rewardRepository;

  GetExchanges({required this.rewardRepository});

  @override
  Future<Either<Failure, List<BillExchange>>> call(GetExchangesParams params) async{
    //throw UnimplementedError();
    print("GetExchanges->call");
    return await rewardRepository.selectBillExchanges(accessToken: params.accessToken, page: params.page);
  }
}

class GetExchangesParams extends Equatable {
  final String accessToken;
  final int page;

  const GetExchangesParams({required this.accessToken, required this.page});

  @override
  List<Object> get props => [accessToken, page];
}
