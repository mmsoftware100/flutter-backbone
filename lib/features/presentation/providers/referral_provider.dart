

import 'package:base/core/error/failures.dart';
import 'package:base/features/domain/entities/dashboard.dart';
import 'package:base/features/domain/entities/referral.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:base/features/domain/usecases/get_dashboard.dart';
import 'package:base/features/domain/usecases/get_referral_list.dart';
import 'package:base/features/domain/usecases/user_register.dart';
import 'package:base/features/domain/usecases/user_update.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../data/const/data.dart';
import '../../data/datasources/local_storage.dart';
import '../../domain/usecases/user_login.dart';
class ReferralProvider extends ChangeNotifier {
  final GetReferralList getReferralList;

  // break the rule
  // final LocalStorage localStorage;

  ReferralProvider({
    required this.getReferralList,
  });

  List<Referral> referrallist = [];

  Future<String> getReferrallistPlz({
    required String accessToken
  })async{
    final Either<Failure, List<Referral>> referralListEither = await getReferralList(GetReferralListParams(
        accessToken: accessToken
    ));
    return referralListEither.fold(
            (failure)  {
          // specify failure
          print("WalletProvider->getReferrallistPlz->failure");
          print(failure);
          notifyListeners();
          return failure.toString();
        },
            (referralListUpdated)  async{
          print("WalletProvider->getReferrallistPlz->referralListUpdated");
          referrallist = referralListUpdated;
          notifyListeners();
          return  "success";
        }
    );
  }
}
