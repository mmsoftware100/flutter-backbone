import 'package:base/core/usercase/usecase.dart';
import 'package:base/features/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';


class UserRegister implements UseCase<User, UserRegisterParams>{
  final UserRepository userRepository;

  UserRegister({
    required this.userRepository
  });

  @override
  Future<Either<Failure, User>> call(UserRegisterParams params) {
    return userRepository.register(user: params.user);
  }
}

class UserRegisterParams extends Equatable{
  final User user;

  const UserRegisterParams({
    required this.user,
  });
  @override
  List<Object> get props => [user];
}
