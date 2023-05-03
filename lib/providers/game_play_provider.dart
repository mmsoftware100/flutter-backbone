import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:myan_quiz/domain/entities/answer.dart';
import 'package:myan_quiz/domain/entities/category.dart';
import 'package:myan_quiz/domain/entities/description.dart';
import 'package:myan_quiz/domain/entities/user.dart';
import 'package:myan_quiz/domain/usecases/get_question_by_category_id.dart';
import 'package:myan_quiz/domain/usecases/get_random_categories.dart';
import 'package:myan_quiz/domain/usecases/submit_answer.dart';

import '../core/error/failures.dart';
import '../domain/entities/game_type.dart';
import '../domain/entities/question.dart';

class GamePlayProvider extends ChangeNotifier{
  final GetRandomCategories getRandomCategories;
  final GetQuestionByCategoryId getQuestionByCategoryId;
  final SubmitAnswer submitAnswer;

  GamePlayProvider({
    required this.getRandomCategories,
    required this.getQuestionByCategoryId,
    required this.submitAnswer
  });
  /* list of data */
  /*
      1. list of game type
      2  game type detail

   */
  /* list of use case */
  /*
    1. select game types
        @input
         access token
        @output
          List of game types
    2.
  */

  // data repo
  List<GameType> gameTypes = [];
  GameType gameType = GameType.sample;

  List<Category> categories = [];
  Category category = Category.sample;

  Question question = Question.sample;


  // methods
  Future<bool> selectGameTypes({required String accessToken}){
    bool status = true;
    return Future.delayed(Duration(seconds: 5),(){
      gameTypes = [
        GameType(id: 1, name: "Game Type One", image: "https://ssl.gstatic.com/ui/v1/icons/mail/rfr/logo_gmail_lockup_default_1x_r5.png"),
        GameType(id: 2, name: "Game Type Two", image: "https://pub.dev/static/hash-t3bgi1vk/img/pub-dev-logo-2x.png"),
        GameType(id: 3, name: "Game Type Three", image: "https://app-cdn.clickup.com/assets/images/brand/clickup-symbol_color.svg"),
      ];
      notifyListeners();
      return status;
    });
  }
  void setGameType(GameType gameTypeUpdate){
    gameType = gameTypeUpdate;
    notifyListeners();
  }


  Future<bool> selectCategories({required String accessToken})async{
    final Either<Failure, List<Category>> categoriesListEither = await getRandomCategories(GetRandomCategoriesParams(accessToken: accessToken));
    return categoriesListEither.fold(
            (failure)  {
          print("GamePlayProvider->selectCategories failuer");
          print(failure);
          return false;
        },
            (categoriesListData)  async{
          categories = categoriesListData;
          return true;
        }
    );

    bool status = true;
    return Future.delayed(Duration(seconds: 5),(){
      categories = [
        Category(id: 1, name: "Game Category One", image: "https://ssl.gstatic.com/ui/v1/icons/mail/rfr/logo_gmail_lockup_default_1x_r5.png"),
        Category(id: 2, name: "Game Category Two", image: "https://pub.dev/static/hash-t3bgi1vk/img/pub-dev-logo-2x.png")
      ];
      notifyListeners();
      return status;
    });
  }

  void setCategory(Category categoryUpdate){
    category = categoryUpdate;
    notifyListeners();
  }


  Future<bool> selectQuestionByCategoryId({required String accessToken, required int gameTypeId, required int categoryId})async{
    print("GamePlayProvider->selectQuestionByCategoryId");
    final Either<Failure, Question> questionEither = await getQuestionByCategoryId(GetQuestionByCategoryIdParams(accessToken: accessToken, categoryId: categoryId, gamePlayTypeId: gameTypeId));
    return questionEither.fold(
            (failure)  {
              print("GamePlayProvider->selectQuestionByCategoryId failuer");
              print(failure);
              return false;
            },
            (questionData)  async{
              print("GamePlayProvider->selectQuestionByCategoryId success");
              question = questionData;
              question.answers.shuffle();
              notifyListeners();
              return true;
           }
    );
    /*
    bool status = true;
    return Future.delayed(Duration(seconds: 5),(){
      question = Question(
          id: 1,
          name: "အိုးစားဖက်တွင် စုစုပေါင်း ______ ဉီး ပါဝင်သည်။",
          image: "https://myanquiz.com/images/game_play_one.jpg",
          answers: [
            Answer(id: 1, name:  "၆ ဉီး"),
            Answer(id: 2, name: "၅ ဉီး"),
            Answer(id: 3, name: "၇ ဉီး"),
            Answer(id: 4, name: "၄ ဉီး"),
          ],
          description: Description(
            id: 1,
            answerId: 4,
            name: "အိုးစားဖက်တွင် (၄) ဉီး ပါဝင်သည်"
          )
      );
      notifyListeners();
      return status;
    });

     */
  }
  Future<User> answer({required String accessToken, required int gameTypeId, required int questionId, required int answerId})async{
    print("GamePlayProvider->answer");
    final Either<Failure, User> userEither = await submitAnswer(SubmitAnswerParams(accessToken: accessToken, answerId: answerId, gameTypeId: gameTypeId, questionId: questionId));
    return userEither.fold(
            (failure)  {
          print("GamePlayProvider->answer failure");
          print(failure);
          throw Exception("wrong answer");
        },
            (userData)  async{
          print("GamePlayProvider->answer success");
          return userData;
        }
    );
    /*
    return Future.delayed(Duration(seconds: 5),(){
      User user = User(
          id: 1,
          name: "name",
          rank: "rank",
          level: "level",
          nextLevel: "nextLevel",
          levelProgress: 50,
          questionTotal: 150,
          questionPassed: 110,
          questionFailed: 40,
          coinTotal: 450,
          coinExchanged: 201,
          coinCurrent: 125,
          createdAt: DateTime.now(),
          modifiedAt: DateTime.now(),
          createdAgo: "createdAgo",
          modifiedAgo: "modifiedAgo",
          accessToken: accessToken
      );
      return user;
    });

     */
  }

}

