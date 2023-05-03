
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:myan_quiz/domain/entities/bill_exchange_rate.dart';
import 'package:myan_quiz/domain/entities/telephone_operator.dart';
import 'package:myan_quiz/domain/repositories/reward_repository.dart';

import '../../core/error/failures.dart';
import '../../core/usercase/usecase.dart';

class GetBills implements UseCase<List<Bill>,GetBillParams>{
  final RewardRepository rewardRepository;

  GetBills({required this.rewardRepository});

  @override
  Future<Either<Failure, List<Bill>>> call(GetBillParams params) async{
    //throw UnimplementedError();
    print("GetExchangeRates->call");
    return await rewardRepository.selectBills(accessToken: params.accessToken, page: params.page);
  }
}

class GetBillParams extends Equatable {
  final String accessToken;
  final int page;

  const GetBillParams({required this.accessToken, required this.page});

  @override
  List<Object> get props => [accessToken, page];
}
