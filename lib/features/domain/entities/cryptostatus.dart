
class CryptoStatus{
  String? timestamp;
  int? error_code;
  String? error_message;
  int? elapsed;
  int? credit_count;
  String? notice;
  int? total_count;

  CryptoStatus({
    required this.timestamp,
    required this.error_code,
    required this.error_message,
    required this.elapsed,
    required this.credit_count,
    required this.notice,
    required this.total_count
  });

  CryptoStatus.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    error_code = json['error_code'];
    error_message = json['error_message'];
    elapsed = json['elapsed'];
    credit_count = json['credit_count'];
    notice = json['notice'];
    total_count = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    data['error_code'] = this.error_code;
    data['error_message'] = this.error_message;
    data['elapsed'] = this.elapsed;
    data['credit_count'] = this.credit_count;
    data['notice'] = this.notice;
    data['total_count'] = this.total_count;
    return data;
  }


  // static CryptoStatus sample () => CryptoStatus(timestamp: "2023-06012T14:54:22.991Z",error_code: "0",error_message: "",elapsed: "16",credit_count: "1",notice: "",total_count: "10435");
}