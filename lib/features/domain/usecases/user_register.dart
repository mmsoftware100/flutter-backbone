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
    return userRepository.register(password: params.password, email: params.email, name: params.name);
  }
}

class UserRegisterParams extends Equatable{
  final String password;
  final String email;
  final String name;

  const UserRegisterParams({
    required this.password,
    required this.email,
    required this.name
  });
  @override
  List<Object> get props => [password, email, name];
}
