import 'package:base/features/domain/entities/data.dart';

class WalletInfo {
  bool status;
  String message;
  Data data;

  WalletInfo(
      {
        required this.status,
        required this.message,
        required this.data});


  static WalletInfo sample(){
    return WalletInfo(status: false, message: "message", data: Data.sample());
  }
}