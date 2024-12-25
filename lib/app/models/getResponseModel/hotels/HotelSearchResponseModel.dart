import 'dart:convert';

// Helper methods for JSON serialization/deserialization
HotelSearchResponseModel getSearchedHotelsResponseFromJson(String str) =>
    HotelSearchResponseModel.fromJson(json.decode(str));

String getSearchedHotelsResponseToJson(HotelSearchResponseModel data) =>
    json.encode(data.toJson());

class HotelSearchResponseModel {
  final List<Hotel> data;
  final bool status;
  final Filters filters;
  final QueryParams queryParams;
  final Pages pages;

  HotelSearchResponseModel({
    required this.data,
    required this.status,
    required this.filters,
    required this.queryParams,
    required this.pages,
  });

  factory HotelSearchResponseModel.fromJson(Map<String, dynamic> json) {
    return HotelSearchResponseModel(
      data: (json['data'] as List).map((item) => Hotel.fromJson(item)).toList(),
      status: json['status'] ?? false,
      filters: Filters.fromJson(json['filters']),
      queryParams: QueryParams.fromJson(json['queryParams']),
      pages: Pages.fromJson(json['pages']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((hotel) => hotel.toJson()).toList(),
      'status': status,
      'filters': filters.toJson(),
      'queryParams': queryParams.toJson(),
      'pages': pages.toJson(),
    };
  }
}

class Hotel {
  final String hotelBufferReferenceId;
  final PriceInfo priceInfo;
  final ServiceInfo serviceInfo;

  Hotel({
    required this.hotelBufferReferenceId,
    required this.priceInfo,
    required this.serviceInfo,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      hotelBufferReferenceId: json['hotelBufferReferenceId'] ?? '',
      priceInfo: PriceInfo.fromJson(json['priceInfo']),
      serviceInfo: ServiceInfo.fromJson(json['serviceInfo']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hotelBufferReferenceId': hotelBufferReferenceId,
      'priceInfo': priceInfo.toJson(),
      'serviceInfo': serviceInfo.toJson(),
    };
  }
}

class PriceInfo {
  final String currencySymbol;
  final double payable;

  PriceInfo({
    required this.currencySymbol,
    required this.payable,
  });

  factory PriceInfo.fromJson(Map<String, dynamic> json) {
    final currency = json['currency'] ?? {};
    return PriceInfo(
      currencySymbol: currency['symbol'] ?? '',
      payable: json['payable']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currency': {'symbol': currencySymbol},
      'payable': payable,
    };
  }
}

class ServiceInfo {
  final String title;
  final String address;
  final int star;
  final String thumbnail;
  final String details;

  ServiceInfo({
    required this.title,
    required this.address,
    required this.star,
    required this.thumbnail,
    required this.details,
  });

  factory ServiceInfo.fromJson(Map<String, dynamic> json) {
    return ServiceInfo(
      title: json['title'] ?? 'No Title',
      address: json['address'] ?? 'No Address',
      star: json['star'] ?? 0,
      thumbnail: json['thumbnail'] ?? '',
      details: json['details'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'address': address,
      'star': star,
      'thumbnail': thumbnail,
      'details': details,
    };
  }
}

class Filters {
  final double minPrice;
  final double maxPrice;

  Filters({
    required this.minPrice,
    required this.maxPrice,
  });

  factory Filters.fromJson(Map<String, dynamic> json) {
    final price = json['price'] ?? {};
    return Filters(
      minPrice: price['min']?.toDouble() ?? 0.0,
      maxPrice: price['max']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'price': {
        'min': minPrice,
        'max': maxPrice,
      },
    };
  }
}

class QueryParams {
  final String checkin;
  final String checkout;

  QueryParams({
    required this.checkin,
    required this.checkout,
  });

  factory QueryParams.fromJson(Map<String, dynamic> json) {
    return QueryParams(
      checkin: json['checkin'] ?? '',
      checkout: json['checkout'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'checkin': checkin,
      'checkout': checkout,
    };
  }
}

class Pages {
  final int resultCount;
  final int perPage;
  final int pageCount;
  final String page;

  Pages({
    required this.resultCount,
    required this.perPage,
    required this.pageCount,
    required this.page,
  });

  factory Pages.fromJson(Map<String, dynamic> json) {
    return Pages(
      resultCount: json['resultCount'] ?? 0,
      perPage: json['perPage'] ?? 0,
      pageCount: json['pageCount'] ?? 0,
      page: json['page'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'resultCount': resultCount,
      'perPage': perPage,
      'pageCount': pageCount,
      'page': page,
    };
  }
}
