import 'package:myan_quiz/domain/entities/bill_exchange_rate.dart';
import 'package:myan_quiz/domain/entities/bill_exchange_status.dart';
import 'package:myan_quiz/domain/entities/telephone_operator.dart';

class BillExchange{

  int id;
  String phoneNo;
  int telephoneOperatorId;
  int billExchangeRateId;
  int billExchangeStatusId;
  TelephoneOperator telephoneOperator;
  Bill billExchangeRate;
  BillExchangeStatus billExchangeStatus;
  DateTime createdAt;
  DateTime modifiedAt;
  String createdAgo;
  String modifiedAgo;

  BillExchange({
    required this.id,
    required this.phoneNo,
    required this.telephoneOperatorId,
    required this.billExchangeRateId,
    required this.billExchangeStatusId,
    required this.telephoneOperator,
    required this.billExchangeRate,
    required this.billExchangeStatus,
    required this.createdAt,
    required this.modifiedAt,
    required this.createdAgo,
    required this.modifiedAgo
  });



  static BillExchange get sample {
    return BillExchange(
        id: 0,
        phoneNo: "phoneNo",
        telephoneOperatorId: TelephoneOperator.sample.id,
        billExchangeRateId: Bill.sample.id,
        billExchangeStatusId: BillExchangeStatus.sample.id,
        telephoneOperator: TelephoneOperator.sample,
        billExchangeRate: Bill.sample,
        billExchangeStatus: BillExchangeStatus.sample,
        createdAt: DateTime.now(),
        modifiedAt: DateTime.now(),
        createdAgo: "createdAgo",
        modifiedAgo: "modifiedAgo"
    );
  }
}