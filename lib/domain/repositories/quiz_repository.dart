import 'package:dartz/dartz.dart';
import 'package:myan_quiz/core/error/failures.dart';
import 'package:myan_quiz/domain/entities/question.dart';
import 'package:myan_quiz/domain/entities/user.dart';

import '../entities/category.dart';
abstract class QuizRepository{
  Future<Either<Failure,List<Category>>> selectCategories({
    required String accessToken
  });

  Future<Either<Failure,Question>> selectQuestionByCategoryId({
    required String accessToken,
    required int categoryId
  });

  Future<Either<Failure,User>> submitAnswer({
    required String accessToken,
    required int gameTypeId,
    required int questionId,
    required int answerId
  });


}