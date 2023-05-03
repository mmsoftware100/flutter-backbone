
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:myan_quiz/domain/entities/bill_exchange.dart';
import 'package:myan_quiz/domain/entities/bill_exchange_rate.dart';
import 'package:myan_quiz/domain/entities/telephone_operator.dart';
import 'package:myan_quiz/domain/repositories/reward_repository.dart';

import '../../core/error/failures.dart';
import '../../core/usercase/usecase.dart';

class RequestExchange implements UseCase<BillExchange,RequestExchangeParams>{
  final RewardRepository rewardRepository;

  RequestExchange({required this.rewardRepository});

  @override
  Future<Either<Failure, BillExchange>> call(RequestExchangeParams params) async{
    //throw UnimplementedError();
    print("RequestExchange->call");
    return await rewardRepository.exchangeBill(accessToken: params.accessToken, telephoneOperatorId: params.telephoneOperatorId, billExchangeRateId: params.billExchangeRateId, phoneNo: params.phoneNo);
  }
}

class RequestExchangeParams extends Equatable {
  final String accessToken;
  final int telephoneOperatorId;
  final int billExchangeRateId;
  final String phoneNo;

  const RequestExchangeParams({required this.accessToken, required this.telephoneOperatorId,required this.billExchangeRateId,required this.phoneNo,});

  @override
  List<Object> get props => [accessToken, telephoneOperatorId, billExchangeRateId, phoneNo];
}
