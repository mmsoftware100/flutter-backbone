
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:myan_quiz/domain/entities/category.dart';
import 'package:myan_quiz/domain/repositories/quiz_repository.dart';

import '../../core/error/failures.dart';
import '../../core/usercase/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetRandomCategories implements UseCase<List<Category>,GetRandomCategoriesParams>{
  final QuizRepository quizRepository;

  GetRandomCategories({required this.quizRepository});

  @override
  Future<Either<Failure, List<Category>>> call(GetRandomCategoriesParams params) async{
    //throw UnimplementedError();
    return await quizRepository.selectCategories(accessToken: params.accessToken);
  }
}

class GetRandomCategoriesParams extends Equatable {
  final String accessToken;

  const GetRandomCategoriesParams({required this.accessToken});

  @override
  List<Object> get props => [accessToken];
}
