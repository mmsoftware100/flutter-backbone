import 'package:base/features/domain/entities/cryptodata.dart';
import 'package:base/features/domain/entities/cryptostatus.dart';

class Crypto{
  CryptoStatus? status;
  List<CryptoData>? data;

  Crypto({this.status, this.data});

  Crypto.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ? new CryptoStatus.fromJson(json['status']) : null;
    if (json['data'] != null) {
      data = <CryptoData>[];
      json['data'].forEach((v) {
        data!.add(new CryptoData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  // List<Crypto> toResponseList(List<dynamic> data) {
  //   List<Crypto> value = <Crypto>[];
  //   data.forEach((element) {
  //     value.add(Crypto.fromJson(element));
  //   });
  //   return value ?? List<Crypto>.empty();
  // }
}