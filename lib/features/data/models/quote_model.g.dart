// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteModel _$QuoteModelFromJson(Map<String, dynamic> json) => QuoteModel(
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      volume24h: (json['volume_24h'] as num?)?.toDouble() ?? 0.0,
      volumeChange24h: (json['volume_change_24h'] as num?)?.toDouble() ?? 0.0,
      percentChange1h: (json['percent_change_1h'] as num?)?.toDouble() ?? 0.0,
      percentChange24h: (json['percent_change_24h'] as num?)?.toDouble() ?? 0.0,
      percentChange7d: (json['percent_change_7d'] as num?)?.toDouble() ?? 0.0,
      percentChange30d: (json['percent_change_30d'] as num?)?.toDouble() ?? 0.0,
      percentChange60d: (json['percent_change_60d'] as num?)?.toDouble() ?? 0.0,
      percentChange90d: (json['percent_change_90d'] as num?)?.toDouble() ?? 0.0,
      marketCap: (json['market_cap'] as num?)?.toDouble() ?? 0.0,
      marketCapDominance:
          (json['market_cap_dominance'] as num?)?.toDouble() ?? 0.0,
      fullyDilutedMarketCap:
          (json['fully_diluted_market_cap'] as num?)?.toDouble() ?? 0.0,
      tvl: (json['tvl'] as num?)?.toDouble(),
      lastUpdated: json['last_updated'] as String? ?? '',
    );

Map<String, dynamic> _$QuoteModelToJson(QuoteModel instance) =>
    <String, dynamic>{
      'price': instance.price,
      'volume_24h': instance.volume24h,
      'volume_change_24h': instance.volumeChange24h,
      'percent_change_1h': instance.percentChange1h,
      'percent_change_24h': instance.percentChange24h,
      'percent_change_7d': instance.percentChange7d,
      'percent_change_30d': instance.percentChange30d,
      'percent_change_60d': instance.percentChange60d,
      'percent_change_90d': instance.percentChange90d,
      'market_cap': instance.marketCap,
      'market_cap_dominance': instance.marketCapDominance,
      'fully_diluted_market_cap': instance.fullyDilutedMarketCap,
      'tvl': instance.tvl,
      'last_updated': instance.lastUpdated,
    };
