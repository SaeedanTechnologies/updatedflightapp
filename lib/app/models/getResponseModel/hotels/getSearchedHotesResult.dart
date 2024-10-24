// To parse this JSON data, do
//
//     final getSearchedHotelsResponse = getSearchedHotelsResponseFromJson(jsonString);

import 'dart:convert';

GetSearchedHotelsResponse getSearchedHotelsResponseFromJson(String str) => GetSearchedHotelsResponse.fromJson(json.decode(str));

String getSearchedHotelsResponseToJson(GetSearchedHotelsResponse data) => json.encode(data.toJson());

class GetSearchedHotelsResponse {
    final List<Datum>? data;
    final bool? status;
    final Filters? filters;
    final QueryParams? queryParams;
    final Pages? pages;

    GetSearchedHotelsResponse({
        this.data,
        this.status,
        this.filters,
        this.queryParams,
        this.pages,
    });

    factory GetSearchedHotelsResponse.fromJson(Map<String, dynamic> json) => GetSearchedHotelsResponse(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        status: json["status"],
        filters: json["filters"] == null ? null : Filters.fromJson(json["filters"]),
        queryParams: json["queryParams"] == null ? null : QueryParams.fromJson(json["queryParams"]),
        pages: json["pages"] == null ? null : Pages.fromJson(json["pages"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "status": status,
        "filters": filters?.toJson(),
        "queryParams": queryParams?.toJson(),
        "pages": pages?.toJson(),
    };
}

class Datum {
    final String? hotelBufferReferenceId;
    final PriceInfo? priceInfo;
    final ServiceInfo? serviceInfo;
    final int? onholdable;
    final Supplier? supplier;
    final String? luxotaCode;

    Datum({
        this.hotelBufferReferenceId,
        this.priceInfo,
        this.serviceInfo,
        this.onholdable,
        this.supplier,
        this.luxotaCode,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        hotelBufferReferenceId: json["hotelBufferReferenceId"],
        priceInfo: json["priceInfo"] == null ? null : PriceInfo.fromJson(json["priceInfo"]),
        serviceInfo: json["serviceInfo"] == null ? null : ServiceInfo.fromJson(json["serviceInfo"]),
        onholdable: json["onholdable"],
        supplier: supplierValues.map[json["supplier"]]!,
        luxotaCode: json["luxotaCode"],
    );

    Map<String, dynamic> toJson() => {
        "hotelBufferReferenceId": hotelBufferReferenceId,
        "priceInfo": priceInfo?.toJson(),
        "serviceInfo": serviceInfo?.toJson(),
        "onholdable": onholdable,
        "supplier": supplierValues.reverse[supplier],
        "luxotaCode": luxotaCode,
    };
}

class PriceInfo {
    final Currency? currency;
    final double? payable;
    final double? b2C;
    final int? commission;
    final double? perNightPayable;

    PriceInfo({
        this.currency,
        this.payable,
        this.b2C,
        this.commission,
        this.perNightPayable,
    });

    factory PriceInfo.fromJson(Map<String, dynamic> json) => PriceInfo(
        currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
        payable: json["payable"]?.toDouble(),
        b2C: json["b2c"]?.toDouble(),
        commission: json["commission"],
        perNightPayable: json["perNightPayable"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "currency": currency?.toJson(),
        "payable": payable,
        "b2c": b2C,
        "commission": commission,
        "perNightPayable": perNightPayable,
    };
}

class Currency {
    final int? id;
    final Title? title;
    final Abb? abb;
    final Symbol? symbol;
    final int? decimalPlaces;

    Currency({
        this.id,
        this.title,
        this.abb,
        this.symbol,
        this.decimalPlaces,
    });

    factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        title: titleValues.map[json["title"]]!,
        abb: abbValues.map[json["abb"]]!,
        symbol: symbolValues.map[json["symbol"]]!,
        decimalPlaces: json["decimal_places"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": titleValues.reverse[title],
        "abb": abbValues.reverse[abb],
        "symbol": symbolValues.reverse[symbol],
        "decimal_places": decimalPlaces,
    };
}

enum Abb {
    USD
}

final abbValues = EnumValues({
    "USD": Abb.USD
});

enum Symbol {
    EMPTY
}

final symbolValues = EnumValues({
    "\u0024": Symbol.EMPTY
});

enum Title {
    UNITED_STATES_DOLLAR
}

final titleValues = EnumValues({
    "United States dollar": Title.UNITED_STATES_DOLLAR
});

class ServiceInfo {
    final String? title;
    final int? propertyType;
    final int? star;
    final int? tripadvisorRating;
    final String? districts;
    final String? thumbnail;
    final String? details;
    final TripadvisorReviewUrl? tripadvisorReviewUrl;
    final String? phone;
    final String? address;

    ServiceInfo({
        this.title,
        this.propertyType,
        this.star,
        this.tripadvisorRating,
        this.districts,
        this.thumbnail,
        this.details,
        this.tripadvisorReviewUrl,
        this.phone,
        this.address,
    });

    factory ServiceInfo.fromJson(Map<String, dynamic> json) => ServiceInfo(
        title: json["title"],
        propertyType: json["property_type"],
        star: json["star"],
        tripadvisorRating: json["tripadvisor_rating"],
        districts: json["districts"],
        thumbnail: json["thumbnail"],
        details: json["details"],
        tripadvisorReviewUrl: tripadvisorReviewUrlValues.map[json["tripadvisor_review_url"]]!,
        phone: json["phone"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "property_type": propertyType,
        "star": star,
        "tripadvisor_rating": tripadvisorRating,
        "districts": districts,
        "thumbnail": thumbnail,
        "details": details,
        "tripadvisor_review_url": tripadvisorReviewUrlValues.reverse[tripadvisorReviewUrl],
        "phone": phone,
        "address": address,
    };
}

enum TripadvisorReviewUrl {
    EMPTY
}

final tripadvisorReviewUrlValues = EnumValues({
    "#": TripadvisorReviewUrl.EMPTY
});

enum Supplier {
    FK
}

final supplierValues = EnumValues({
    "FK": Supplier.FK
});

class Filters {
    final Price? price;
    final List<String>? districts;
    final List<int>? stars;

    Filters({
        this.price,
        this.districts,
        this.stars,
    });

    factory Filters.fromJson(Map<String, dynamic> json) => Filters(
        price: json["price"] == null ? null : Price.fromJson(json["price"]),
        districts: json["districts"] == null ? [] : List<String>.from(json["districts"]!.map((x) => x)),
        stars: json["stars"] == null ? [] : List<int>.from(json["stars"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "price": price?.toJson(),
        "districts": districts == null ? [] : List<dynamic>.from(districts!.map((x) => x)),
        "stars": stars == null ? [] : List<dynamic>.from(stars!.map((x) => x)),
    };
}

class Price {
    final double? min;
    final double? max;

    Price({
        this.min,
        this.max,
    });

    factory Price.fromJson(Map<String, dynamic> json) => Price(
        min: json["min"]?.toDouble(),
        max: json["max"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "min": min,
        "max": max,
    };
}

class Pages {
    final int? resultCount;
    final int? perPage;
    final int? pageCount;
    final String? page;

    Pages({
        this.resultCount,
        this.perPage,
        this.pageCount,
        this.page,
    });

    factory Pages.fromJson(Map<String, dynamic> json) => Pages(
        resultCount: json["resultCount"],
        perPage: json["perPage"],
        pageCount: json["pageCount"],
        page: json["page"],
    );

    Map<String, dynamic> toJson() => {
        "resultCount": resultCount,
        "perPage": perPage,
        "pageCount": pageCount,
        "page": page,
    };
}

class QueryParams {
    final DateTime? checkin;
    final DateTime? checkout;
    final int? nightsNo;
    final int? roomsNo;
    final String? currentLang;
    final List<RoomsDetail>? roomsDetail;
    final Currency? marketplaceCurrency;
    final Currency? buyerCurrency;
    final dynamic defaultCalendar;
    final DestinationCity? destinationCity;
    final Country? nationalityCountry;
    final dynamic checkInShamsiDate;
    final dynamic checkOutShamsiDate;

    QueryParams({
        this.checkin,
        this.checkout,
        this.nightsNo,
        this.roomsNo,
        this.currentLang,
        this.roomsDetail,
        this.marketplaceCurrency,
        this.buyerCurrency,
        this.defaultCalendar,
        this.destinationCity,
        this.nationalityCountry,
        this.checkInShamsiDate,
        this.checkOutShamsiDate,
    });

    factory QueryParams.fromJson(Map<String, dynamic> json) => QueryParams(
        checkin: json["checkin"] == null ? null : DateTime.parse(json["checkin"]),
        checkout: json["checkout"] == null ? null : DateTime.parse(json["checkout"]),
        nightsNo: json["nights_no"],
        roomsNo: json["rooms_no"],
        currentLang: json["current_lang"],
        roomsDetail: json["rooms_detail"] == null ? [] : List<RoomsDetail>.from(json["rooms_detail"]!.map((x) => RoomsDetail.fromJson(x))),
        marketplaceCurrency: json["marketplace_currency"] == null ? null : Currency.fromJson(json["marketplace_currency"]),
        buyerCurrency: json["buyer_currency"] == null ? null : Currency.fromJson(json["buyer_currency"]),
        defaultCalendar: json["default_calendar"],
        destinationCity: json["destination_city"] == null ? null : DestinationCity.fromJson(json["destination_city"]),
        nationalityCountry: json["nationality_country"] == null ? null : Country.fromJson(json["nationality_country"]),
        checkInShamsiDate: json["checkInShamsiDate"],
        checkOutShamsiDate: json["checkOutShamsiDate"],
    );

    Map<String, dynamic> toJson() => {
        "checkin": "${checkin!.year.toString().padLeft(4, '0')}-${checkin!.month.toString().padLeft(2, '0')}-${checkin!.day.toString().padLeft(2, '0')}",
        "checkout": "${checkout!.year.toString().padLeft(4, '0')}-${checkout!.month.toString().padLeft(2, '0')}-${checkout!.day.toString().padLeft(2, '0')}",
        "nights_no": nightsNo,
        "rooms_no": roomsNo,
        "current_lang": currentLang,
        "rooms_detail": roomsDetail == null ? [] : List<dynamic>.from(roomsDetail!.map((x) => x.toJson())),
        "marketplace_currency": marketplaceCurrency?.toJson(),
        "buyer_currency": buyerCurrency?.toJson(),
        "default_calendar": defaultCalendar,
        "destination_city": destinationCity?.toJson(),
        "nationality_country": nationalityCountry?.toJson(),
        "checkInShamsiDate": checkInShamsiDate,
        "checkOutShamsiDate": checkOutShamsiDate,
    };
}

class DestinationCity {
    final int? id;
    final int? countryId;
    final String? en;
    final String? abb;
    final int? priority;
    final int? status;
    final String? timezone;
    final String? fa;
    final String? ar;
    final dynamic ku;
    final dynamic tr;
    final Country? country;
    final String? title;

    DestinationCity({
        this.id,
        this.countryId,
        this.en,
        this.abb,
        this.priority,
        this.status,
        this.timezone,
        this.fa,
        this.ar,
        this.ku,
        this.tr,
        this.country,
        this.title,
    });

    factory DestinationCity.fromJson(Map<String, dynamic> json) => DestinationCity(
        id: json["id"],
        countryId: json["country_id"],
        en: json["en"],
        abb: json["abb"],
        priority: json["priority"],
        status: json["status"],
        timezone: json["timezone"],
        fa: json["fa"],
        ar: json["ar"],
        ku: json["ku"],
        tr: json["tr"],
        country: json["country"] == null ? null : Country.fromJson(json["country"]),
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "country_id": countryId,
        "en": en,
        "abb": abb,
        "priority": priority,
        "status": status,
        "timezone": timezone,
        "fa": fa,
        "ar": ar,
        "ku": ku,
        "tr": tr,
        "country": country?.toJson(),
        "title": title,
    };
}

class Country {
    final int? id;
    final String? en;
    final String? abb;
    final String? fa;
    final String? ar;
    final dynamic ku;
    final dynamic tr;
    final String? phoneCode;
    final String? flag;
    final String? title;

    Country({
        this.id,
        this.en,
        this.abb,
        this.fa,
        this.ar,
        this.ku,
        this.tr,
        this.phoneCode,
        this.flag,
        this.title,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        en: json["en"],
        abb: json["abb"],
        fa: json["fa"],
        ar: json["ar"],
        ku: json["ku"],
        tr: json["tr"],
        phoneCode: json["phone_code"],
        flag: json["flag"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "en": en,
        "abb": abb,
        "fa": fa,
        "ar": ar,
        "ku": ku,
        "tr": tr,
        "phone_code": phoneCode,
        "flag": flag,
        "title": title,
    };
}

class RoomsDetail {
    final String? adults;
    final String? children;
    final Map<String, String>? childAge;

    RoomsDetail({
        this.adults,
        this.children,
        this.childAge,
    });

    factory RoomsDetail.fromJson(Map<String, dynamic> json) => RoomsDetail(
        adults: json["adults"],
        children: json["children"],
        childAge: Map.from(json["child-age"]!).map((k, v) => MapEntry<String, String>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "adults": adults,
        "children": children,
        "child-age": Map.from(childAge!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
