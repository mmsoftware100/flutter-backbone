import 'package:dartz/dartz.dart';
import 'package:myan_quiz/core/error/failures.dart';
import 'package:myan_quiz/domain/entities/user.dart';
abstract class UserRepository{
  Future<Either<Failure, User>> login({
    required String accessToken,
    required String fcmToken,
  });


  Future<Either<Failure, User>> loginWithEmail({
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> loginWithGoogle({
    required String accessToken
  });
  Future<Either<Failure, User>> userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String city,
    required String age,
    required String gender
  });

}