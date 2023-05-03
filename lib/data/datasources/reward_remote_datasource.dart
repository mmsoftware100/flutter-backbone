
import 'package:myan_quiz/data/models/bill_exchange_model.dart';
import 'package:myan_quiz/data/models/category_model.dart';
import 'package:myan_quiz/data/models/question_model.dart';
import 'package:myan_quiz/data/models/user_model.dart';

import '../../domain/entities/bill_exchange.dart';
import '../../domain/entities/bill_exchange_rate.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/question.dart';
import '../../domain/entities/telephone_operator.dart';
import '../../domain/entities/user.dart';
import '../const/const.dart';
import '../models/bill_exchange_rate_model.dart';
import '../models/telephone_operator_model.dart';
import 'network_interface.dart';


abstract class RewardRemoteDataSource{

  Future<List<TelephoneOperator>> selectTelephoneOperators({
    required String accessToken,
    required int page
  });

  Future<List<Bill>> selectBillExchangeRates({
    required String accessToken,
    required int page
  });

  Future<List<BillExchange>> selectBillExchanges({
    required String accessToken,
    required int page
  });

  Future<BillExchange> exchangeBill({
    required String accessToken,
    required int telephoneOperatorId,
    required int billExchangeRateId,
    required String phoneNo
  });
}

class RewardRemoteDatasourceImpl implements RewardRemoteDataSource{
  final NetworkInterface networkInterface;

  RewardRemoteDatasourceImpl({required this.networkInterface});
  @override
  Future<BillExchange> exchangeBill({required String accessToken, required int telephoneOperatorId, required int billExchangeRateId, required String phoneNo}) async{
    print("RewardRemoteDatasourceImpl->exchangeBill");
    var body = {
      "phone_operator_id" : telephoneOperatorId,
      "bill_id" : billExchangeRateId,
      "phone" : phoneNo
    };
    dynamic response = await networkInterface.postRequest(url: exchangeBillEndpoint, data: body, bearerToken: accessToken);
    try{
      print(response);
      Map<String,dynamic> data = response['data'];
      return BillExchangeModel.fromJson(data).toEntity();
    }
    catch(e,stackTrace){
      print("QuizRemoteDatasourceImpl->selectCategories exception");
      print(e);
      print(stackTrace);
      rethrow;
    }
  }

  @override
  Future<List<Bill>> selectBillExchangeRates({required String accessToken, required int page}) async{
    print("RewardRemoteDatasourceImpl->exchangeBill");
    dynamic response = await networkInterface.getRequest(url: selectBillEndpoint+"?page=$page", data: {}, bearerToken: accessToken);
    try{
      print(response);
      List<dynamic> data = response['data'];
      List<Bill> billExchangeRates = [];
      for (var element in data) {
        billExchangeRates.add(BillExchangeRateModel.fromJson(element).toEntity());
      }
      print("RewardRemoteDatasourceImpl->exchangeBill success");
      return billExchangeRates;
    }
    catch(e,stackTrace){
      print("RewardRemoteDatasourceImpl->exchangeBill exception");
      print(e);
      print(stackTrace);
      rethrow;
    }
  }

  @override
  Future<List<BillExchange>> selectBillExchanges({required String accessToken, required int page}) async{
    print("RewardRemoteDatasourceImpl->selectBillExchanges");
    var body = {
      "type" : "bill"
    };
    dynamic response = await networkInterface.postRequest(url: selectBillExchangesEndpoint+"?page=$page", data: body, bearerToken: accessToken);

    try{
      print(response);
      List<dynamic> data = response['data'];
      List<BillExchange> billExchanges = [];
      for (var element in data) {
        billExchanges.add(BillExchangeModel.fromJson(element).toEntity());
      }
      print("RewardRemoteDatasourceImpl->selectBillExchanges success");
      return billExchanges;
    }
    catch(e,stackTrace){
      print("RewardRemoteDatasourceImpl->selectBillExchanges exception");
      print(e);
      print(stackTrace);
      rethrow;
    }
  }

  @override
  Future<List<TelephoneOperator>> selectTelephoneOperators({required String accessToken, required int page}) async{
    print("RewardRemoteDatasourceImpl->selectTelephoneOperators");
    dynamic response = await networkInterface.getRequest(url: selectTelephoneOperatorsEndpoint+"?page=$page", data: {}, bearerToken: accessToken);
    try{
      print(response);
      List<dynamic> data = response['data'];
      List<TelephoneOperator> telephoneOperators = [];
      for (var element in data) {
        telephoneOperators.add(TelephoneOperatorModel.fromJson(element).toEntity());
      }
      print("RewardRemoteDatasourceImpl->selectTelephoneOperators success");
      return telephoneOperators;
    }
    catch(e,stackTrace){
      print("RewardRemoteDatasourceImpl->selectTelephoneOperators exception");
      print(e);
      print(stackTrace);
      rethrow;
    }
  }

}

/*
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
    try{
      //bool status = response['status'];
      //String message = response['msg'];
      Map<String,dynamic> data = response['data'];
      QuestionModel questionModel = QuestionModel.fromJson(data);
      return questionModel.toEntity();
    }
    catch(e,stackTrace){
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
      Map<String,dynamic> data = response['data'];
      UserModel userModel = UserModel.fromJson(data);
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

 */