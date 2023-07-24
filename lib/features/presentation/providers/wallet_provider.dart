

import 'package:base/core/error/failures.dart';
import 'package:base/features/domain/entities/dashboard.dart';
import 'package:base/features/domain/entities/deposit_address.dart';
import 'package:base/features/domain/entities/deposit_transaction.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:base/features/domain/entities/withdraw_transaction.dart';
import 'package:base/features/domain/usecases/get_dashboard.dart';
import 'package:base/features/domain/usecases/get_depositaddress_list.dart';
import 'package:base/features/domain/usecases/get_deposittransaction_list.dart';
import 'package:base/features/domain/usecases/get_withdrawtransaction_list.dart';
import 'package:base/features/domain/usecases/request_deposittransaction.dart';
import 'package:base/features/domain/usecases/request_withdrawtransaction.dart';
import 'package:base/features/domain/usecases/user_register.dart';
import 'package:base/features/domain/usecases/user_update.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../data/const/data.dart';
import '../../data/datasources/local_storage.dart';
import '../../domain/usecases/user_login.dart';
class WalletProvider extends ChangeNotifier {
  final GetDepositAddressList getDepositAddressList;
  final GetDepositTransactionList getDepositTransactionList;
  final GetWithdrawTransactionList getWithdrawTransactionList;
  final RequestDepositTransaction requestDepositTransaction;
  final RequestWithdrawTransaction requestWithdrawTransaction;
  // break the rule
  // final LocalStorage localStorage;

  WalletProvider({
    required this.getDepositAddressList,
    required this.getDepositTransactionList,
    required this.getWithdrawTransactionList,
    required this.requestDepositTransaction,
    required this.requestWithdrawTransaction
  });

  List<DepositAddress> depositAddressList = [];
  List<DepositTransaction> depositTransactionList = [];
  List<WithdrawTransaction> withdrawTransactionList = [];
  DepositTransaction depositTransaction = DepositTransaction.sample();
  WithdrawTransaction withdrawTransaction = WithdrawTransaction.sample();

  Future<String> getDepositAddressListPlz({
    required String accessToken
  })async{
    final Either<Failure, List<DepositAddress>> depositAddressListEither = await getDepositAddressList(GetDepositAddressListParams(
        accessToken: accessToken
    ));
    return depositAddressListEither.fold(
            (failure)  {
          // specify failure
          print("WalletProvider->getDepositAddresslistPlz->failure");
          print(failure);
          notifyListeners();
          return failure.toString();
        },
            (depositaddressListUpdated)  async{
          print("WalletProvider->getDepositAddresslistPlz->depositaddresslistData");
          depositAddressList = depositaddressListUpdated;
          notifyListeners();
          return  "success";
        }
    );
  }
  Future<String> getDepositTransactionListPlz({
    required String accessToken
  })async{
    final Either<Failure, List<DepositTransaction>> deposittransactionListEither = await getDepositTransactionList(GetDepositTransactionListParams(
        accessToken: accessToken
    ));
    return deposittransactionListEither.fold(
            (failure)  {
          // specify failure
          print("WalletProvider->getDepositTransactionlistPlz->failure");
          print(failure);
          notifyListeners();
          return failure.toString();
        },
            (deposittransactionListUpdated)  async{
          print("WalletProvider->getDepositTransactionlistPlz->deposittransactionlistData");
          depositTransactionList = deposittransactionListUpdated;
          notifyListeners();
          return  "success";
        }
    );
  }
  Future<String> getWithdrawTransactionListPlz({
    required String accessToken
  })async{
    final Either<Failure, List<WithdrawTransaction>> withdrawtransactionListEither = await getWithdrawTransactionList(GetWithdrawTransactionListParams(
        accessToken: accessToken
    ));
    return withdrawtransactionListEither.fold(
            (failure)  {
          // specify failure
          print("WalletProvider->getWithdrawTransactionlistPlz->failure");
          print(failure);
          notifyListeners();
          return failure.toString();
        },
            (withdrawtransactionListUpdated)  async{
          print("WalletProvider->getWithdrawTransactionlistPlz->withdrawtransactionlistData");
          withdrawTransactionList = withdrawtransactionListUpdated;
          notifyListeners();
          return  "success";
        }
    );
  }
  Future<String> requestDepositTransactionPlz({
    required String accessToken,
    required String link,
    required double depositAmount,
  })async{
    final Either<Failure, DepositTransaction> depositTransactionEither = await requestDepositTransaction(RequestDepositTransactionParams(
      accessToken: accessToken,
      link: link,
      depositAmount: depositAmount,
    ));
    return depositTransactionEither.fold(
            (failure)  {
          // specify failure
          print("WalletProvider->requestDepositTransactionPlz->failure");
          print(failure);
          notifyListeners();
          if(failure is GeneralFailure){
            print(failure.message);
            return failure.message;
          }
          return failure.toString();
        },
            (depositTransactionData)  async{
          print("WalletProvider->requestDepositTransactionPlz->depositTransactionData");
          print(depositTransactionData);
          depositTransaction = depositTransactionData;
          notifyListeners();

          return  "success";
        }
    );
  }

  Future<String> requestWithdrawTransactionPlz({
    required String accessToken,
    required String withdrawAddress,
    required double withdrawAmount
  })async{
    final Either<Failure, WithdrawTransaction> withdrawTransactionEither = await requestWithdrawTransaction(RequestWithdrawTransactionParams(
        accessToken: accessToken,
        withdrawAddress: withdrawAddress,
        withdrawAmount: withdrawAmount
    ));
    return withdrawTransactionEither.fold(
            (failure)  {
          // specify failure
          print("WalletProvider->requestWithdrawTransactionPlz->failure");
          print(failure);
          notifyListeners();
          if(failure is GeneralFailure){
            print(failure.message);
            return failure.message;
          }
          return failure.toString();
        },
            (withdrawTransactionData)  async{
          print("WalletProvider->requestWithdrawTransactionPlz->withdrawTransactionData");
          print(withdrawTransactionData);
          withdrawTransaction = withdrawTransactionData;
          notifyListeners();
          return  withdrawTransaction.remark;
        }
    );
  }

}
