import 'package:dartz/dartz.dart';
import 'package:myan_quiz/core/error/failures.dart';
import 'package:myan_quiz/data/datasources/user_remote_datasource.dart';
import 'package:myan_quiz/domain/entities/user.dart';
import 'package:myan_quiz/domain/repositories/user_repository.dart';


class UserRepositoryImpl implements UserRepository{
  UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});


  @override
  Future<Either<Failure, User>> login({required String accessToken, required String fcmToken}) async{
    try{
      User user =  await userRemoteDataSource.login(accessToken: accessToken, fcmToken: fcmToken);
      return Right(user);
    }
    catch(exp){
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> loginWithEmail({required String email, required String password}) async{
    try{
      User user =  await userRemoteDataSource.loginWithEmail(email: email, password: password);
      return Right(user);
    }
    catch(exp){
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> loginWithGoogle({required String accessToken}) async{
    try{
      User user =  await userRemoteDataSource.loginWithGoogle(accessToken: accessToken);
      return Right(user);
    }
    catch(exp){
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> userRegister({required String name, required String email, required String password, required String phone, required String city, required String age, required String gender}) async{
    try{
      User user =  await userRemoteDataSource.userRegister(name: name, email: email, password: password, phone: phone, city: city, age: age, gender: gender);
      return Right(user);
    }
    catch(exp){
      return Left(ServerFailure());
    }
  }


}
