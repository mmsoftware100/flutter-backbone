
import 'package:base/features/domain/entities/cryptoquote.dart';
import 'package:base/features/domain/entities/platform.dart';

class CryptoData{
  int? id;
  String? name;
  String? symbol;
  String? slug;
  int? numMarketPairs;
  String? dateAdded;
  List<String>? tags;
  int? maxSupply;
  double? circulatingSupply;
  double? totalSupply;
  bool? infiniteSupply;
  Platform? platform;
  int? cmcRank;
  double? selfReportedCirculatingSupply;
  double? selfReportedMarketCap;
  double? tvlRatio;
  String? lastUpdated;
  Quote? quote;

  CryptoData({
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
    required this.platform,
    required this.cmcRank,
    required this.selfReportedCirculatingSupply,
    required this.selfReportedMarketCap,
    required this.tvlRatio,
    required this.lastUpdated,
    required this.quote
  });

  CryptoData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    numMarketPairs = json['num_market_pairs'];
    dateAdded = json['date_added'];
    tags = json['tags'].cast<String>();
    maxSupply = json['max_supply'];
    circulatingSupply = json['circulating_supply'];
    totalSupply = json['total_supply'];
    infiniteSupply = json['infinite_supply'];
    platform = json['platform'] != null
        ? new Platform.fromJson(json['platform'])
        : null;
    cmcRank = json['cmc_rank'];
    selfReportedCirculatingSupply = json['self_reported_circulating_supply'];
    selfReportedMarketCap = json['self_reported_market_cap'];
    tvlRatio = json['tvl_ratio'];
    lastUpdated = json['last_updated'];
    quote = json['quote'] != null ? new Quote.fromJson(json['quote']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['slug'] = this.slug;
    data['num_market_pairs'] = this.numMarketPairs;
    data['date_added'] = this.dateAdded;
    data['tags'] = this.tags;
    data['max_supply'] = this.maxSupply;
    data['circulating_supply'] = this.circulatingSupply;
    data['total_supply'] = this.totalSupply;
    data['infinite_supply'] = this.infiniteSupply;
    if (this.platform != null) {
      data['platform'] = this.platform!.toJson();
    }
    data['cmc_rank'] = this.cmcRank;
    data['self_reported_circulating_supply'] =
        this.selfReportedCirculatingSupply;
    data['self_reported_market_cap'] = this.selfReportedMarketCap;
    data['tvl_ratio'] = this.tvlRatio;
    data['last_updated'] = this.lastUpdated;
    if (this.quote != null) {
      data['quote'] = this.quote!.toJson();
    }
    return data;
  }

  // static CryptoData sample () => CryptoData(id:3408,name:"USD Coin",symbol: "USDC",slug: "usd-coin",num_market_pairs: 12953,date_added: "2022-05-02T08:07:12.000Z",tags:[
  //   "medium-of-exchange",
  //   "enterprise-solutions",
  //   "smart-contracts",
  //   "eos",
  //   "fenbushi-capital-portfolio",
  //   "galaxy-digital-portfolio"
  // ], max_supply: 0,circulating_supply: 738180199.37,total_supply: 738180199.37,infinite_supply: false,cmc_rank: 5,self_reported_circulating_supply: 0,self_reported_market_cap: 0,tvl_ratio: 0,last_updated: "2022-05-02T08:07:12.000Z");
}