import 'package:base/features/data/models/quote_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CryptoModel {
  @JsonKey(name: 'id', defaultValue: 0)
  int id;

  @JsonKey(name: 'name', defaultValue: '')
  String name;

  @JsonKey(name: 'symbol', defaultValue: '')
  String symbol;

  @JsonKey(name: 'slug', defaultValue: '')
  String slug;

  @JsonKey(name: 'num_market_pairs', defaultValue: 0)
  int numMarketPairs;

  @JsonKey(name: 'date_added', defaultValue: '')
  String dateAdded;

  @JsonKey(name: 'tags', defaultValue: [])
  List<String> tags;

  @JsonKey(name: 'max_supply', defaultValue: 0.0)
  double maxSupply;

  @JsonKey(name: 'circulating_supply', defaultValue: 0.0)
  double circulatingSupply;

  @JsonKey(name: 'total_supply', defaultValue: 0.0)
  double totalSupply;

  @JsonKey(name: 'infinite_supply', defaultValue: false)
  bool infiniteSupply;

  @JsonKey(name: 'cmc_rank', defaultValue: 0)
  int cmcRank;

  @JsonKey(name: 'last_updated', defaultValue: '')
  String lastUpdated;

  @JsonKey(name: 'quote', defaultValue: {})
  Map<String, QuoteModel> quote;

  CryptoModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.numMarketPairs,
    required this.dateAdded,
    required this.tags,
    required this.maxSupply,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.infiniteSupply,
    required this.cmcRank,
    required this.lastUpdated,
    required this.quote,
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json) => _$CryptoModelFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoModelToJson(this);
}
