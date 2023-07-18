import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';

import '../../../core/error/exceptions.dart';
import 'package:encrypt/encrypt.dart';

import '../const/data.dart';

abstract class NetworkCall {
  Future<dynamic> getRequest({required String url, required Map<
      String,
      dynamic> data,
    String? bearerToken,
    Map<String, dynamic>? headers
  });

  Future<dynamic> postRequest({required String url, required Map<
      String,
      dynamic> data, String? bearerToken});

  Future<dynamic> putRequest(
      {required String url, required int id, required Map<String,
          dynamic> data, String? bearerToken});

  Future<dynamic> deleteRequest(
      {required String url, required int id, String? bearerTplem});
}

class NetworkCallImpl implements NetworkCall {
  final Dio client;
  final String _secretKey = "my 32 length key................";
  NetworkCallImpl({
    required this.client
  });

  String _encrypt(String data) {

    /*
    final iv = IV.fromLength(16);
    //final encrypter = Encrypter(AES(Key.fromUtf8(_secretKey)), iv: iv);
    final encrypter = Encrypter(AES(Key.fromUtf8(_secretKey)));
    final encrypted = encrypter.encrypt(data, iv: iv);
    return base64.encode(encrypted.bytes) + ':' + base64.encode(iv.bytes);

     */


    // final key = Key.fromUtf8(_secretKey);
    final key = Key.fromUtf8('my 32 length key................');
    final iv = IV.fromSecureRandom(16); // IV.fromLength(16);

    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(data, iv: iv);
    //return encrypted.base64;
    print("data ");
    print(data);
    print("key");
    print("my 32 length key................");
    print('iv.base64');
    print(iv.base64);
    print("encrypted.base64");
    print(encrypted.base64);
    print(encrypted.bytes.toString());
    String finalString = encrypted.base64 + ':' + iv.base64;
    print("finalString");
    print(finalString);
    return finalString;
    //return base64.encode(encrypted.bytes) + ':' + base64.encode(iv.bytes);


  }


  String _decrypt(String data) {
    final parts = data.split(':');
    final encryptedData = base64.decode(parts[0]);
    final iv = IV.fromLength(16);
    iv.bytes.setAll(0, base64.decode(parts[1]));
    //final encrypter = Encrypter(AES(Key.fromUtf8(_secretKey)), iv: iv);
    final encrypter = Encrypter(AES(Key.fromUtf8(_secretKey)));
    final decrypted = encrypter.decrypt64(encryptedData as String);
    return decrypted;
  }


  @override
  Future<dynamic> deleteRequest({required String url, required int id, String? bearerTplem}) async{
    try{
      String endPoint = url + "/$id";
      Map<String,dynamic> data = {};
      if(bearerTplem != null){
        client.options.headers["Authorization"] = "Bearer $bearerTplem";
      }
      Response<dynamic> response = await client.delete(endPoint);
      data = response.data;
      return data;
    }
    catch(exp){
      if(exp is DioError){
        print("exp is DioError");
        print(exp.response);
      }
      print(exp);
      throw ServerException();
    }

  }

  @override
  Future<dynamic> getRequest({required String url, required Map<String,dynamic> data, String? bearerToken, Map<String, dynamic>? headers}) async{
    try{
      String endPoint = url;
      if(bearerToken != null){
        client.options.headers["Authorization"] = "Bearer $bearerToken";
      }
      if(headers != null){
        headers.forEach((key, value) {
          client.options.headers[key] = value;
        });
      }
      if(data != null){

        endPoint = endPoint + "?";
        data.forEach((key, value) {
          endPoint = endPoint + key.toString() + "=" + value.toString() + "&";
        });
      }

      print("final endpoint is $endPoint");

      Response<dynamic> response = await client.get(endPoint);
      print("response.data, statusCode and statusMessage");
      print(response.data);
      print(response.statusCode);
      print(response.statusMessage);

      return cipher ?  jsonDecode(OurApiEncrypt.decrypt(response.data)) : response.data;
      // return response.data;
    }
    catch(exp){
      if(exp is DioError){
        print("exp is DioError");
        print(exp.response);
      }
      print(exp);
      throw ServerException();
    }
  }

  @override
  Future<dynamic> postRequest({required String url, required Map<String,dynamic> data, String? bearerToken}) async{
    try{
      String endPoint = url;
      if(bearerToken != null){
        client.options.headers["Authorization"] = "Bearer $bearerToken";
      }
      // do we need to encrypt?
      Response<dynamic> response = await client.post(endPoint, data:  data); // cipher ? OurApiEncrypt.encrypt(json.encode(data)) :
      // do we need to decrypt?
      print("response.data, statusCode and statusMessage");
      print(response.data);
      print(response.statusCode);
      print(response.statusMessage);
      //print(response.data.runtimeType);
      //print(response.data.toString().length);
      return cipher ?  jsonDecode(OurApiEncrypt.decrypt(response.data)) : response.data;
      /*


      // String responseString = "lA5pUstimZanjLD8ZWcuhl5x+Et+WMZNQTYhhbmHQWiWVBh3AJxBfpO6SdU4vJysY5H88G/RUU63Cfbe62cM6w==:9rny3u1r67orqx50"; // it has to be response.data
      //print("responseString");
      // print(responseString);
      // List<String> strArr = responseString.split(":");
      String encryptedResponseBody = strArr.first;
      String encryptedBase64IV = strArr[1];
      print("encryptedResponseBody");
      print(encryptedResponseBody);
      print("encryptedBase64IV");
      print(encryptedBase64IV);
      final decryptedBody = OurApiEncrypt.decrypt(encryptedResponseBody, encryptedBase64IV);
      print(decryptedBody);
      dynamic da = json.decode(decryptedBody);
      // return decryptedBody
      print("da");
      print(da);
      print(da.runtimeType);
      //throw Exception();

      print(encryptedBody);
      //Response<dynamic> response = await client.post(endPoint, data: data);
      Response<dynamic> response = await client.post(endPoint, data: encryptedBody);
      final decryptedResponse = _decrypt(response.data);
      //return response.data;
      return decryptedResponse;

       */

    }
    catch(exp, stackTrace){
      if(exp is DioError){
        print("exp is DioError");
        print(exp.response);
        throw GeneralException(message: exp.response.toString());
      }
      print(exp);
      print(stackTrace);
      throw ServerException();
    }
  }

  @override
  Future<dynamic> putRequest(
      {required String url, required int id, required Map<String,
          dynamic> data, String? bearerToken}) async{
    try{
      String endPoint = url + "/$id";
      if(bearerToken != null){
        client.options.headers["Authorization"] = "Bearer $bearerToken";
      }
      Response<dynamic> response = await client.put(endPoint, data: data);
      return response.data;
    }
    catch(exp){
      if(exp is DioError){
        print("exp is DioError");
        print(exp.response);
      }
      print(exp);
      throw ServerException();
    }
  }

}




class OurApiEncrypt{
  static Key key = Key.fromUtf8("1245714587458888");
  // static IV iv = IV.fromUtf8("e16ce888a20dadb8");
  static Encrypter ourEncrypt = Encrypter(AES(key, mode: AESMode.cbc));

  static String decrypt(String encryptedResponse) {
    print("network_call->decrypt $encryptedResponse");
    // move split logic to HERE
    // split to get iv
    List<String> strArr = encryptedResponse.split(":");
    strArr.forEach((element) {
      // print(element);
    });
    print(strArr.length);
    print(strArr.last);
    if(strArr.length != 2){
      throw Exception("invalid response format to split IV");
      //return "";
    }
    String encrypted = strArr.first;
    String iv = strArr[1];


     Encrypted enBase64 = Encrypted.from64(encrypted);
    //Encrypted enBase64 = Encrypted.from64(strArr.first);
     // final decrypted = ourEncrypt.decrypt(enBase64, iv: iv);
     final decrypted = ourEncrypt.decrypt(enBase64, iv: IV.fromUtf8(iv));
    //final decrypted = ourEncrypt.decrypt(enBase64, iv: IV.fromUtf8(strArr[1]));
    return decrypted;
  }

  static String encrypt(String value) {
    String randomString16 = randomString(16);
    IV iv = IV.fromUtf8(randomString16); //  IV.fromSecureRandom(16);
    final encrypted = ourEncrypt.encrypt(value, iv: iv);
    print("value ");
    print(value);
    print("iv");
    print(iv.base64);
    print(randomString16);
    //Codec<String, String> stringToBase64 = utf8.fuse(base64);
    //print("decoded iv is ");
    //print(stringToBase64.decode(iv.base));
    print("encrypted.base64");
    print(encrypted.base64);


    String finalString = encrypted.base64 + ':' + iv.base64;
    print("finalString");
    print(finalString);

    return finalString; // encrypted.base64;
  }


  static String randomString(int len){
    final random = Random();
    final chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final codeUnits = List.generate(len, (index) {
      final index = random.nextInt(chars.length);
      return chars.codeUnitAt(index);
    });
    final randomString = String.fromCharCodes(codeUnits);
    print(randomString);
    return randomString;
  }
}

