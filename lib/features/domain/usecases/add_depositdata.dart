import 'package:base/core/usercase/usecase.dart';
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/domain/entities/depositdata.dart';
import 'package:base/features/domain/entities/walletinfo.dart';
import 'package:base/features/domain/repositories/crypto_repository.dart';
import 'package:base/features/domain/repositories/deposit_repository.dart';
import 'package:base/features/domain/repositories/investordashboard_repository.dart';
import 'package:base/features/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';


class AddDepositData implements UseCase<DepositData, AddDepositDataParams>{
  final DepositRepository depositRepository;

  AddDepositData({
    required this.depositRepository
  });

  @override
  Future<Either<Failure, DepositData>> call(AddDepositDataParams params) {
    return depositRepository.AddDepositData(accessToken: params.accessToken,link: params.link,deposit_amount: params.deposit_amount);
  }
}

class AddDepositDataParams extends Equatable{
  final String accessToken;
  final String link;
  final double deposit_amount;

  const AddDepositDataParams({
    required this.accessToken,
    required this.link,
    required this.deposit_amount,
  });
  @override
  List<Object> get props => [accessToken,link,deposit_amount];
}
