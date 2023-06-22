import 'package:json_annotation/json_annotation.dart';
part 'quote_model.g.dart';
@JsonSerializable(explicitToJson: true)
class QuoteModel {
  @JsonKey(name: 'price', defaultValue: 0.0)
  final double price;

  @JsonKey(name: 'volume_24h', defaultValue: 0.0)
  final double volume24h;

  @JsonKey(name: 'volume_change_24h', defaultValue: 0.0)
  final double volumeChange24h;

  @JsonKey(name: 'percent_change_1h', defaultValue: 0.0)
  final double percentChange1h;

  @JsonKey(name: 'percent_change_24h', defaultValue: 0.0)
  final double percentChange24h;

  @JsonKey(name: 'percent_change_7d', defaultValue: 0.0)
  final double percentChange7d;

  @JsonKey(name: 'percent_change_30d', defaultValue: 0.0)
  final double percentChange30d;

  @JsonKey(name: 'percent_change_60d', defaultValue: 0.0)
  final double percentChange60d;

  @JsonKey(name: 'percent_change_90d', defaultValue: 0.0)
  final double percentChange90d;

  @JsonKey(name: 'market_cap', defaultValue: 0.0)
  final double marketCap;

  @JsonKey(name: 'market_cap_dominance', defaultValue: 0.0)
  final double marketCapDominance;

  @JsonKey(name: 'fully_diluted_market_cap', defaultValue: 0.0)
  final double fullyDilutedMarketCap;

  @JsonKey(name: 'tvl', defaultValue: null)
  final double? tvl;

  @JsonKey(name: 'last_updated', defaultValue: '')
  final String lastUpdated;

  QuoteModel({
    required this.price,
    required this.volume24h,
    required this.volumeChange24h,
    required this.percentChange1h,
    required this.percentChange24h,
    required this.percentChange7d,
    required this.percentChange30d,
    required this.percentChange60d,
    required this.percentChange90d,
    required this.marketCap,
    required this.marketCapDominance,
    required this.fullyDilutedMarketCap,
    required this.tvl,
    required this.lastUpdated,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) => _$QuoteModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteModelToJson(this);
}
