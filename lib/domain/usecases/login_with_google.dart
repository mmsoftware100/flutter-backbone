
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failures.dart';
import '../../core/usercase/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class LoginWithGoogle implements UseCase<User,LoginWithGoogleParams>{
  final UserRepository userRepository;

  LoginWithGoogle({required this.userRepository});

  @override
  Future<Either<Failure, User>> call(LoginWithGoogleParams params) async{
    return await userRepository.loginWithGoogle(accessToken: params.accessToken);
  }
}

class LoginWithGoogleParams extends Equatable {
  final String accessToken;

  const LoginWithGoogleParams({required this.accessToken});

  @override
  List<Object> get props => [accessToken];
}
