import 'package:dartz/dartz.dart';
import 'package:myan_quiz/core/error/failures.dart';
import 'package:myan_quiz/data/datasources/quiz_remote_datasource.dart';
import 'package:myan_quiz/data/datasources/user_remote_datasource.dart';
import 'package:myan_quiz/domain/entities/category.dart';
import 'package:myan_quiz/domain/entities/question.dart';
import 'package:myan_quiz/domain/entities/user.dart';
import 'package:myan_quiz/domain/repositories/quiz_repository.dart';
import 'package:myan_quiz/domain/repositories/user_repository.dart';

class QuizRepositoryImpl implements QuizRepository{
  QuizRemoteDatasource quizRemoteDatasource;
  QuizRepositoryImpl({required this.quizRemoteDatasource});

  @override
  Future<Either<Failure, List<Category>>> selectCategories({required String accessToken}) async{

    try{
      List<Category> categoryList =  await quizRemoteDatasource.selectCategories(accessToken: accessToken);
      return Right(categoryList);
    }
    catch(exp){
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Question>> selectQuestionByCategoryId({required String accessToken, required int categoryId}) async{
    try{
      Question question =  await quizRemoteDatasource.selectQuestionByCategoryId(accessToken: accessToken, categoryId: categoryId);
      return Right(question);
    }
    catch(exp){
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> submitAnswer({required String accessToken, required int gameTypeId, required int questionId, required int answerId}) async{
    try{
      User user =  await quizRemoteDatasource.submitAnswer(accessToken: accessToken, gameTypeId: gameTypeId, questionId: questionId, answerId: answerId);
      return Right(user);
    }
    catch(exp){
      return Left(ServerFailure());
    }
  }

}
