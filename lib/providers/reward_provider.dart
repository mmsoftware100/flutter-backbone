import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:myan_quiz/domain/entities/answer.dart';
import 'package:myan_quiz/domain/entities/bill_exchange.dart';
import 'package:myan_quiz/domain/entities/bill_exchange_rate.dart';
import 'package:myan_quiz/domain/entities/bill_exchange_status.dart';
import 'package:myan_quiz/domain/entities/category.dart';
import 'package:myan_quiz/domain/entities/description.dart';
import 'package:myan_quiz/domain/entities/telephone_operator.dart';
import 'package:myan_quiz/domain/entities/user.dart';
import 'package:myan_quiz/domain/usecases/get_exchange_rates.dart';
import 'package:myan_quiz/domain/usecases/get_exchanges.dart';
import 'package:myan_quiz/domain/usecases/get_telephone_operators.dart';
import 'package:myan_quiz/domain/usecases/request_exchange.dart';

import '../core/error/failures.dart';
import '../domain/entities/game_type.dart';
import '../domain/entities/question.dart';

class RewardProvider extends ChangeNotifier{
  final GetTelephoneOperators getTelephoneOperators;
  final GetBills getExchangeRates;
  final RequestExchange requestExchange;
  final GetExchanges getExchanges;

  RewardProvider({
    required this.getTelephoneOperators,
    required this.getExchangeRates,
    required this.requestExchange,
    required this.getExchanges
  });

  // data repo
  List<TelephoneOperator> telephoneOperators = [];
  TelephoneOperator telephoneOperator = TelephoneOperator.sample;


  List<Bill> billExchangeRates = [];
  Bill billExchangeRate = Bill.sample;

  List<BillExchange> billExchanges = [];
  BillExchange billExchange = BillExchange.sample;


  // methods

  Future<bool> selectTelephoneOperators({required String accessToken})async{
    print("RewardProvider->selectTelephoneOperators");
    //throw Exception("General");
    final Either<Failure, List<TelephoneOperator>> telephoneOperatorListEither = await getTelephoneOperators(GetTelephoneOperatorsParams(accessToken: accessToken, page: 1));
    return telephoneOperatorListEither.fold(
            (failure)  {
          print("GamePlayProvider->selectTelephoneOperators failure");
          print(failure);
          return false;
        },
            (telephoneOperatorListData)  async{
              print("GamePlayProvider->selectTelephoneOperators success");
              telephoneOperators = telephoneOperatorListData;
              notifyListeners();
          return true;
        }
    );

    /*
    bool status = true;
    return Future.delayed(Duration(seconds: 5),(){
      telephoneOperators = [
        TelephoneOperator(id: 1, name: "MTP", image: "https://ssl.gstatic.com/ui/v1/icons/mail/rfr/logo_gmail_lockup_default_1x_r5.png"),
        TelephoneOperator(id: 2, name: "ATOM", image: "https://pub.dev/static/hash-t3bgi1vk/img/pub-dev-logo-2x.png"),
        TelephoneOperator(id: 3, name: "MyTel", image: "https://app-cdn.clickup.com/assets/images/brand/clickup-symbol_color.svg"),
        TelephoneOperator(id: 4, name: "Ooredoo", image: "https://ssl.gstatic.com/ui/v1/icons/mail/rfr/logo_gmail_lockup_default_1x_r5.png"),
      ];
      notifyListeners();
      return status;
    });

     */
  }
  void setTelephoneOperator(TelephoneOperator telephoneOperatorUpdate){
    telephoneOperator = telephoneOperatorUpdate;
    notifyListeners();
  }


  Future<bool> selectBills({required String accessToken})async{
    final Either<Failure, List<Bill>> billExchangeRatesEither = await getExchangeRates(GetBillParams(accessToken: accessToken, page: 1));
    return billExchangeRatesEither.fold(
            (failure)  {
          print("GamePlayProvider->selectBills failure");
          print(failure);
          return false;
        },
            (billExchangeRatesData)  async{
          print("GamePlayProvider->selectBills success");
          billExchangeRates = billExchangeRatesData;
          notifyListeners();
          return true;
        }
    );
    /*
    bool status = true;
    return Future.delayed(Duration(seconds: 5),(){
      billExchangeRates = [
        BillExchangeRate(id: 1, name: "Bill 1000",coin: 3000, image: "https://ssl.gstatic.com/ui/v1/icons/mail/rfr/logo_gmail_lockup_default_1x_r5.png"),
        BillExchangeRate(id: 2, name: "Bill 3000",coin: 9000, image: "https://pub.dev/static/hash-t3bgi1vk/img/pub-dev-logo-2x.png"),
        BillExchangeRate(id: 3, name: "Bill 5000",coin: 15000, image: "https://app-cdn.clickup.com/assets/images/brand/clickup-symbol_color.svg"),
        BillExchangeRate(id: 4, name: "Bill 10,000",coin: 30000, image: "https://ssl.gstatic.com/ui/v1/icons/mail/rfr/logo_gmail_lockup_default_1x_r5.png"),
      ];
      notifyListeners();
      return status;
    });

     */
  }
  void setBillExchangeRate(Bill billExchangeRateUpdate){
    billExchangeRate = billExchangeRateUpdate;
    notifyListeners();
  }


  Future<bool> selectBillExchanges({required String accessToken})async{
    final Either<Failure, List<BillExchange>> billExchangesEither = await getExchanges(GetExchangesParams(accessToken: accessToken, page: 1));
    return billExchangesEither.fold(
            (failure)  {
          print("GamePlayProvider->selectBillExchanges failure");
          print(failure);
          return false;
        },
            (billExchangesData)  async{
          print("GamePlayProvider->selectBillExchanges success");
          billExchanges = billExchangesData;
          notifyListeners();
          return true;
        }
    );
    /*
    bool status = true;
    return Future.delayed(Duration(seconds: 5),(){
      billExchanges = [
        BillExchange(
            id: 1,
            phoneNo: "phoneNo",
            telephoneOperatorId: 1,
            billExchangeRateId: 1,
            billExchangeStatusId: 1,
            telephoneOperator: telephoneOperator,
            billExchangeRate: billExchangeRate,
            billExchangeStatus: BillExchangeStatus(id: 1, name: "Pending", image: "image"),
            createdAt: DateTime.now(),
            modifiedAt: DateTime.now(),
            createdAgo: "createdAgo",
            modifiedAgo: "modifiedAgo"
        ),
        BillExchange(
            id: 2,
            phoneNo: "phoneNo",
            telephoneOperatorId: 1,
            billExchangeRateId: 1,
            billExchangeStatusId: 1,
            telephoneOperator: telephoneOperator,
            billExchangeRate: billExchangeRate,
            billExchangeStatus: BillExchangeStatus(id: 2, name: "ထည့်ပေးလိုက်ပါပြီ", image: "image"),
            createdAt: DateTime.now(),
            modifiedAt: DateTime.now(),
            createdAgo: "createdAgo",
            modifiedAgo: "modifiedAgo"
        ),
      ];
      notifyListeners();
      return status;
    });

     */
  }
  void setBillExchange(BillExchange billExchangeUpdate){
    billExchange = billExchangeUpdate;
    notifyListeners();
  }

  Future<bool> exchangeBill({required String accessToken, required int telephoneOperatorId, required int billExchangeRateId, required String phoneNo})async{
    final Either<Failure, BillExchange> billExchangeEither = await requestExchange(RequestExchangeParams(accessToken: accessToken, telephoneOperatorId: telephoneOperatorId, billExchangeRateId: billExchangeRateId, phoneNo: phoneNo));
    return billExchangeEither.fold(
            (failure)  {
          print("GamePlayProvider->exchangeBill failure");
          print(failure);
          return false;
        },
            (billExchangeData)  async{
          print("GamePlayProvider->exchangeBill success");
          billExchange = billExchangeData;
          notifyListeners();
          return true;
        }
    );
    /*
    bool status = true;
    return Future.delayed(Duration(seconds: 5),(){
      billExchange = BillExchange(
          id: 1,
          phoneNo: phoneNo,
          telephoneOperatorId: telephoneOperatorId,
          billExchangeRateId: billExchangeRateId,
          billExchangeStatusId: 1,
          telephoneOperator: telephoneOperator,
          billExchangeRate: billExchangeRate,
          billExchangeStatus: BillExchangeStatus(id: 1, name: "Pending", image: "image"),
          createdAt: DateTime.now(),
          modifiedAt: DateTime.now(),
          createdAgo: "createdAgo",
          modifiedAgo: "modifiedAgo"
      );
      notifyListeners();
      return status;
    });

     */
  }

}

