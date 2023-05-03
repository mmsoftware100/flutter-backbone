import 'package:dartz/dartz.dart';
import 'package:myan_quiz/core/error/failures.dart';
import 'package:myan_quiz/data/datasources/quiz_remote_datasource.dart';
import 'package:myan_quiz/data/datasources/reward_remote_datasource.dart';
import 'package:myan_quiz/data/datasources/user_remote_datasource.dart';
import 'package:myan_quiz/domain/entities/bill_exchange.dart';
import 'package:myan_quiz/domain/entities/bill_exchange_rate.dart';
import 'package:myan_quiz/domain/entities/category.dart';
import 'package:myan_quiz/domain/entities/question.dart';
import 'package:myan_quiz/domain/entities/telephone_operator.dart';
import 'package:myan_quiz/domain/entities/user.dart';
import 'package:myan_quiz/domain/repositories/quiz_repository.dart';
import 'package:myan_quiz/domain/repositories/reward_repository.dart';
import 'package:myan_quiz/domain/repositories/user_repository.dart';

class RewardRepositoryImpl implements RewardRepository{
  RewardRemoteDataSource rewardRemoteDataSource;
  RewardRepositoryImpl({required this.rewardRemoteDataSource});
  @override
  Future<Either<Failure, BillExchange>> exchangeBill({required String accessToken, required int telephoneOperatorId, required int billExchangeRateId, required String phoneNo}) async{
    try{
      BillExchange billExchange =  await rewardRemoteDataSource.exchangeBill(accessToken: accessToken, telephoneOperatorId: telephoneOperatorId, billExchangeRateId: billExchangeRateId, phoneNo: phoneNo);
      return Right(billExchange);
    }
    catch(exp){
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Bill>>> selectBills({required String accessToken, required int page}) async{
    try{
      List<Bill> billExchangeRateList =  await rewardRemoteDataSource.selectBillExchangeRates(accessToken: accessToken, page: page);
      return Right(billExchangeRateList);
    }
    catch(exp){
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<BillExchange>>> selectBillExchanges({required String accessToken, required int page}) async{
    try{
      List<BillExchange> billExchanges =  await rewardRemoteDataSource.selectBillExchanges(accessToken: accessToken, page: page);
      return Right(billExchanges);
    }
    catch(exp){
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<TelephoneOperator>>> selectTelephoneOperators({required String accessToken, required int page}) async{
    try{
      List<TelephoneOperator> telephoneOperators =  await rewardRemoteDataSource.selectTelephoneOperators(accessToken: accessToken, page: page);
      return Right(telephoneOperators);
    }
    catch(exp){
      return Left(ServerFailure());
    }
  }
  
}
