
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:myan_quiz/domain/entities/category.dart';
import 'package:myan_quiz/domain/entities/question.dart';
import 'package:myan_quiz/domain/repositories/quiz_repository.dart';

import '../../core/error/failures.dart';
import '../../core/usercase/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class SubmitAnswer implements UseCase<User,SubmitAnswerParams>{
  final QuizRepository quizRepository;

  SubmitAnswer({required this.quizRepository});

  @override
  Future<Either<Failure, User>> call(SubmitAnswerParams params) async{
    return await quizRepository.submitAnswer(accessToken: params.accessToken, gameTypeId: params.gameTypeId, questionId: params.questionId, answerId: params.answerId);
  }
}

class SubmitAnswerParams extends Equatable {
  final String accessToken;
  final int gameTypeId;
  final int questionId;
  final int answerId;

  const SubmitAnswerParams({required this.accessToken,required this.gameTypeId, required this.questionId, required this.answerId});

  @override
  List<Object> get props => [accessToken,gameTypeId, questionId, answerId];
}
