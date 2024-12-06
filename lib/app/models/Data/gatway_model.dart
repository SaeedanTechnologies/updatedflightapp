//the main Data folder all code in it is written by Murtaza

class GateWaysModel {
  bool? status;
  String? invoiceReferenceId;
  int? invoiceAmount;
  List<Gateways>? gateways; // Updated to hold a list of Gateways objects
  MarketplaceCurrency? marketplaceCurrency;

  GateWaysModel(
      {this.status,
      this.invoiceReferenceId,
      this.invoiceAmount,
      this.gateways,
      this.marketplaceCurrency});

  GateWaysModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    invoiceReferenceId = json['invoiceReferenceId'];
    invoiceAmount = json['invoiceAmount'];
    if (json['gateways'] != null) {
      gateways = <Gateways>[];
      json['gateways'].forEach((v) {
        gateways!.add(Gateways.fromJson(v));
      });
    }
    marketplaceCurrency = json['marketplaceCurrency'] != null
        ? MarketplaceCurrency.fromJson(json['marketplaceCurrency'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['invoiceReferenceId'] = invoiceReferenceId;
    data['invoiceAmount'] = invoiceAmount;
    if (gateways != null) {
      data['gateways'] = gateways!.map((v) => v.toJson()).toList();
    }
    if (marketplaceCurrency != null) {
      data['marketplaceCurrency'] = marketplaceCurrency!.toJson();
    }
    return data;
  }
}

class Gateways {
  // Define properties for Gateways if needed
  // Example:
  String? name;
  String? id;

  Gateways({this.name, this.id});

  Gateways.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}

class MarketplaceCurrency {
  int? id;
  String? title;
  String? abb;
  String? symbol;
  int? decimalPlaces;

  MarketplaceCurrency(
      {this.id, this.title, this.abb, this.symbol, this.decimalPlaces});

  MarketplaceCurrency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    abb = json['abb'];
    symbol = json['symbol'];
    decimalPlaces = json['decimal_places'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['abb'] = abb;
    data['symbol'] = symbol;
    data['decimal_places'] = decimalPlaces;
    return data;
  }
}
