
import 'package:base/core/error/failures.dart';
import 'package:base/features/data/datasources/user_remote_data_source.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:base/features/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl implements UserRepository{

  final UserRemoteDataSource userRemoteDataSource;
  UserRepositoryImpl({
    required this.userRemoteDataSource
  });

  @override
  Future<Either<Failure, User>> login({required String email, required String password}) async{
    try{
      User user =  await userRemoteDataSource.login(email: email, password: password);
      return Right(user);
    }
    catch(exp, stackTrace){
      // TODO: convert exception to failure with meaningful message
      print("UserRepositoryImpl->login exp");
      print(exp);
      print(stackTrace);
      return Left(GeneralFailure(message: exp.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> me({required String accessToken}) async{
    try{
      User user =  await userRemoteDataSource.me(accessToken: accessToken);
      return Right(user);
    }
    catch(exp, stackTrace){
      // TODO: convert exception to failure with meaningful message
      print("UserRepositoryImpl->me exp");
      print(exp);
      print(stackTrace);
      return Left(GeneralFailure(message: exp.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> register({required User user}) async{
    try{
      User registredUser =  await userRemoteDataSource.register(user: user);
      return Right(registredUser);
    }
    catch(exp, stackTrace){
      // TODO: convert exception to failure with meaningful message
      print("UserRepositoryImpl->register exp");
      print(exp);
      print(stackTrace);
      return Left(GeneralFailure(message: exp.toString()));
    }
  }

}