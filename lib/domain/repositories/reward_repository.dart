import 'package:dartz/dartz.dart';
import 'package:myan_quiz/core/error/failures.dart';
import 'package:myan_quiz/domain/entities/bill_exchange.dart';
import 'package:myan_quiz/domain/entities/bill_exchange_rate.dart';
import 'package:myan_quiz/domain/entities/question.dart';
import 'package:myan_quiz/domain/entities/telephone_operator.dart';
import 'package:myan_quiz/domain/entities/user.dart';

import '../entities/category.dart';
abstract class RewardRepository{


  Future<Either<Failure,List<TelephoneOperator>>> selectTelephoneOperators({
    required String accessToken,
    required int page
  });

  Future<Either<Failure,List<Bill>>> selectBills({
    required String accessToken,
    required int page
  });

  Future<Either<Failure,List<BillExchange>>> selectBillExchanges({
    required String accessToken,
    required int page
  });

  Future<Either<Failure,BillExchange>> exchangeBill({
    required String accessToken,
    required int telephoneOperatorId,
    required int billExchangeRateId,
    required String phoneNo
  });


}