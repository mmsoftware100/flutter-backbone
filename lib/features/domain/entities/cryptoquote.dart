
import 'package:base/features/domain/entities/USD.dart';

class Quote {
  USD? uSD;

  Quote({this.uSD});

  Quote.fromJson(Map<String, dynamic> json) {
    uSD = json['USD'] != null ? new USD.fromJson(json['USD']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.uSD != null) {
      data['USD'] = this.uSD!.toJson();
    }
    return data;
  }
}
  // static CryptoQuote sample () => CryptoQuote(timestamp: "2023-06012T14:54:22.991Z",error_code: "0",error_message: "",elapsed: "16",credit_count: "1",notice: "",total_count: "10435");
