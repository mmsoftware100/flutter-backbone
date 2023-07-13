import 'package:base/core/usercase/usecase.dart';
import 'package:base/features/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';

// ok
class UserUpdate implements UseCase<User, UserUpdateParams>{
  final UserRepository userRepository;

  UserUpdate({
    required this.userRepository
  });

  @override
  Future<Either<Failure, User>> call(UserUpdateParams params) {
    return userRepository.Update(user: params.user);
  }
}

class UserUpdateParams extends Equatable{
  final User user;

  const UserUpdateParams({
    required this.user,
  });
  @override
  List<Object> get props => [user];
}
