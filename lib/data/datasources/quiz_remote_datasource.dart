
import 'package:myan_quiz/data/models/category_model.dart';
import 'package:myan_quiz/data/models/question_model.dart';
import 'package:myan_quiz/data/models/user_model.dart';

import '../../domain/entities/category.dart';
import '../../domain/entities/question.dart';
import '../../domain/entities/user.dart';
import '../const/const.dart';
import 'network_interface.dart';

abstract class QuizRemoteDatasource{
  Future<List<Category>> selectCategories({
    required String accessToken
  });

  Future<Question> selectQuestionByCategoryId({
    required String accessToken,
    required int categoryId
  });

  Future<User> submitAnswer({
    required String accessToken,
    required int gameTypeId,
    required int questionId,
    required int answerId
  });
}

class QuizRemoteDatasourceImpl implements QuizRemoteDatasource{
  final NetworkInterface networkInterface;
  QuizRemoteDatasourceImpl({required this.networkInterface});
  @override
  Future<List<Category>> selectCategories({required String accessToken}) async{
    print("QuizRemoteDatasourceImpl->selectCategories");
    dynamic response = await networkInterface.postRequest(url: randomCategoryEndpoint, data: {}, bearerToken: accessToken);
    try{
      //bool status = response['status'];
      //String message = response['msg'];
      print(response);
      List<dynamic> data = response['data'];
      List<Category> categories = [];
      for(int i=0; i < data.length; i++){
        CategoryModel categoryModel = CategoryModel.fromJson(data[i]);
        categories.add(categoryModel.toEntity());
      }
      print("QuizRemoteDatasourceImpl->selectCategories return categories");
      return categories;
    }
    catch(e,stackTrace){
      print("QuizRemoteDatasourceImpl->selectCategories exception");
      print(e);
      print(stackTrace);
      rethrow;
    }
  }

  @override
  Future<Question> selectQuestionByCategoryId({required String accessToken, required int categoryId}) async{
    Map<String, dynamic> data = {
        "category_id" : categoryId
    };
    dynamic response = await networkInterface.postRequest(url: getQuestionByCategoryIdEndpoint, data: data, bearerToken: accessToken);
    print("QuizRemoteDatasouce->selectQuestionByCategoryId  response");
    print(response);
    try{
      //bool status = response['status'];
      //String message = response['msg'];
      // TODO: need to get back on data
      Map<String,dynamic> data = response['data']; // [0];
      QuestionModel questionModel = QuestionModel.fromJson(data);
      return questionModel.toEntity();
    }
    catch(e,stackTrace){
      print("QuizRemoteDatasource->selectQuestionByCategoryId exp");
      print(e);
      print(stackTrace);
      rethrow;
    }
  }

  @override
  Future<User> submitAnswer({required String accessToken, required int gameTypeId, required int questionId, required int answerId}) async{
    print("QuizRemoteDatasource->submitAnswer");
    Map<String, dynamic> data = {
      "game_type_id" : gameTypeId,
      "question_id" : questionId,
      "answer_id" : answerId
    };
    dynamic response = await networkInterface.postRequest(url: submitAnswerEndpoint, data: data, bearerToken: accessToken);
    try{
      //bool status = response['status'];
      //String message = response['msg'];
      Map<String,dynamic> userData = response['data']['user_data'];
      print("userData is");
      print(userData);
      UserModel userModel = UserModel.fromJson(userData);
      print("QuizRemoteDatasource->submitAnswer success");
      return userModel.toEntity();
    }
    catch(e,stackTrace){
      print("QuizRemoteDatasource->submitAnswer exception");
      print(e);
      print(stackTrace);
      rethrow;
    }
  }

}