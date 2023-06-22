// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoModel _$CryptoModelFromJson(Map<String, dynamic> json) => CryptoModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      symbol: json['symbol'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      numMarketPairs: json['num_market_pairs'] as int? ?? 0,
      dateAdded: json['date_added'] as String? ?? '',
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      maxSupply: (json['max_supply'] as num?)?.toDouble() ?? 0.0,
      circulatingSupply:
          (json['circulating_supply'] as num?)?.toDouble() ?? 0.0,
      totalSupply: (json['total_supply'] as num?)?.toDouble() ?? 0.0,
      infiniteSupply: json['infinite_supply'] as bool? ?? false,
      cmcRank: json['cmc_rank'] as int? ?? 0,
      lastUpdated: json['last_updated'] as String? ?? '',
      quote: (json['quote'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, QuoteModel.fromJson(e as Map<String, dynamic>)),
          ) ??
          {},
    );

Map<String, dynamic> _$CryptoModelToJson(CryptoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'slug': instance.slug,
      'num_market_pairs': instance.numMarketPairs,
      'date_added': instance.dateAdded,
      'tags': instance.tags,
      'max_supply': instance.maxSupply,
      'circulating_supply': instance.circulatingSupply,
      'total_supply': instance.totalSupply,
      'infinite_supply': instance.infiniteSupply,
      'cmc_rank': instance.cmcRank,
      'last_updated': instance.lastUpdated,
      'quote': instance.quote.map((k, e) => MapEntry(k, e.toJson())),
    };
