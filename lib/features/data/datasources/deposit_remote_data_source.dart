
import 'package:base/features/data/const/data.dart';
import 'package:base/features/data/models/crypto_model.dart';
import 'package:base/features/domain/entities/depositdata.dart';
import 'package:base/features/domain/entities/walletinfo.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/crypto.dart';
import '../../domain/entities/user.dart';
import '../models/user_model.dart';
import 'network_call.dart';

abstract class DepositRemoteDataSource {
  // register
  Future<DepositData> adddepositdata({required String accessToken, required String link, required double deposit_amount});
}