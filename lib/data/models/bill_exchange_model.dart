import 'package:json_annotation/json_annotation.dart';
import 'package:myan_quiz/data/models/telephone_operator_model.dart';
import 'package:myan_quiz/domain/entities/bill_exchange.dart';
import 'package:myan_quiz/domain/entities/telephone_operator.dart';

import '../../domain/entities/bill_exchange_rate.dart';
import '../../domain/entities/bill_exchange_status.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/user.dart';
import 'bill_exchange_rate_model.dart';
import 'bill_exchange_status_model.dart';


part 'bill_exchange_model.g.dart';
@JsonSerializable(explicitToJson: true)
class BillExchangeModel{

  @JsonKey(defaultValue: 0)
  int id;

  @JsonKey(name: 'phone_no' ,defaultValue: "phone_no")
  String phoneNo;

  @JsonKey(name: 'telephone_operator_id' ,defaultValue: 0)
  int telephoneOperatorId;

  @JsonKey(name: 'bill_exchange_rate_id' ,defaultValue: 0)
  int billExchangeRateId;

  @JsonKey(name: 'bill_exchange_status_id' ,defaultValue: 0)
  int billExchangeStatusId;

  @JsonKey(name: 'telephone_operator' ,defaultValue: null)
  TelephoneOperatorModel? telephoneOperator;

  @JsonKey(name: 'bill_exchange_rate' ,defaultValue: null)
  BillExchangeRateModel? billExchangeRate;

  @JsonKey(name: 'bill_exchange_status' ,defaultValue: null)
  BillExchangeStatusModel? billExchangeStatus;

  @JsonKey(name: 'created_at' ,defaultValue: null)
  DateTime? createdAt;

  @JsonKey(name: 'modified_at' ,defaultValue: null)
  DateTime? modifiedAt;

  @JsonKey(name: 'created_ago' ,defaultValue: "created_ago")
  String createdAgo;

  @JsonKey(name: 'modified_ago' ,defaultValue: "modified_ago")
  String modifiedAgo;

  BillExchangeModel({
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

  factory BillExchangeModel.fromJson(Map<String, dynamic> json) {
    return _$BillExchangeModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$BillExchangeModelToJson(this);


  BillExchange toEntity(){
    return BillExchange(
        id: id,
        phoneNo: phoneNo,
        telephoneOperatorId: telephoneOperatorId,
        billExchangeRateId: billExchangeRateId,
        billExchangeStatusId: billExchangeStatusId,
        telephoneOperator: telephoneOperator?.toEntity() ?? TelephoneOperator.sample,
        billExchangeRate: billExchangeRate?.toEntity() ?? Bill.sample,
        billExchangeStatus: billExchangeStatus?.toEntity() ?? BillExchangeStatus.sample,
        createdAt: createdAt ?? DateTime.now(),
        modifiedAt: modifiedAt ?? DateTime.now(),
        createdAgo: createdAgo,
        modifiedAgo: modifiedAgo
    );
  }
}


