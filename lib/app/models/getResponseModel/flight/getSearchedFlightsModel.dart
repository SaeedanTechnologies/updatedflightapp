// To parse this JSON data, do
//
//     final getSearchFlightResults = getSearchFlightResultsFromJson(jsonString);

import 'dart:convert';

GetSearchFlightResults getSearchFlightResultsFromJson(String str) => GetSearchFlightResults.fromJson(json.decode(str));

String getSearchFlightResultsToJson(GetSearchFlightResults data) => json.encode(data.toJson());

class GetSearchFlightResults {
    final List<Datum> data;
    final bool status;
    final Filters filters;
    final QueryParams queryParams;
    final Pages pages;

    GetSearchFlightResults({
        required this.data,
        required this.status,
        required this.filters,
        required this.queryParams,
        required this.pages,
    });

    factory GetSearchFlightResults.fromJson(Map<String, dynamic> json) => GetSearchFlightResults(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        status: json["status"],
        filters: Filters.fromJson(json["filters"]),
        queryParams: QueryParams.fromJson(json["queryParams"]),
        pages: Pages.fromJson(json["pages"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
        "filters": filters.toJson(),
        "queryParams": queryParams.toJson(),
        "pages": pages.toJson(),
    };
}

class Datum {
    final String flightBufferReferenceId;
    final PriceInfo priceInfo;
    final ServiceInfo serviceInfo;
    final int onholdable;
    final SellerCode sellerCode;

    Datum({
        required this.flightBufferReferenceId,
        required this.priceInfo,
        required this.serviceInfo,
        required this.onholdable,
        required this.sellerCode,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        flightBufferReferenceId: json["flightBufferReferenceId"],
        priceInfo: PriceInfo.fromJson(json["priceInfo"]),
        serviceInfo: ServiceInfo.fromJson(json["serviceInfo"]),
        onholdable: json["onholdable"],
        sellerCode: sellerCodeValues.map[json["sellerCode"]]!,
    );

    Map<String, dynamic> toJson() => {
        "flightBufferReferenceId": flightBufferReferenceId,
        "priceInfo": priceInfo.toJson(),
        "serviceInfo": serviceInfo.toJson(),
        "onholdable": onholdable,
        "sellerCode": sellerCodeValues.reverse[sellerCode],
    };
}

class PriceInfo {
    final Currency currency;
    final double payable;
    final double b2C;
    final double baseFare;
    final BreakDowns breakDowns;
    final bool guaranteed;

    PriceInfo({
        required this.currency,
        required this.payable,
        required this.b2C,
        required this.baseFare,
        required this.breakDowns,
        required this.guaranteed,
    });

    factory PriceInfo.fromJson(Map<String, dynamic> json) => PriceInfo(
        currency: Currency.fromJson(json["currency"]),
        payable: json["payable"]?.toDouble(),
        b2C: json["b2c"]?.toDouble(),
        baseFare: json["baseFare"]?.toDouble(),
        breakDowns: BreakDowns.fromJson(json["breakDowns"]),
        guaranteed: json["guaranteed"],
    );

    Map<String, dynamic> toJson() => {
        "currency": currency.toJson(),
        "payable": payable,
        "b2c": b2C,
        "baseFare": baseFare,
        "breakDowns": breakDowns.toJson(),
        "guaranteed": guaranteed,
    };
}

class BreakDowns {
    final Adult adult;

    BreakDowns({
        required this.adult,
    });

    factory BreakDowns.fromJson(Map<String, dynamic> json) => BreakDowns(
        adult: Adult.fromJson(json["adult"]),
    );

    Map<String, dynamic> toJson() => {
        "adult": adult.toJson(),
    };
}

class Adult {
    final double baseFare;
    final int tax;
    final double serviceCharge;
    final double totalFare;
    final int commission;
    final double payable;
    final dynamic passengersCount;
    final PassengerTypeTotal passengerTypeTotal;

    Adult({
        required this.baseFare,
        required this.tax,
        required this.serviceCharge,
        required this.totalFare,
        required this.commission,
        required this.payable,
        required this.passengersCount,
        required this.passengerTypeTotal,
    });

    factory Adult.fromJson(Map<String, dynamic> json) => Adult(
        baseFare: json["baseFare"]?.toDouble(),
        tax: json["tax"],
        serviceCharge: json["serviceCharge"]?.toDouble(),
        totalFare: json["totalFare"]?.toDouble(),
        commission: json["commission"],
        payable: json["payable"]?.toDouble(),
        passengersCount: json["passengersCount"],
        passengerTypeTotal: PassengerTypeTotal.fromJson(json["passengerTypeTotal"]),
    );

    Map<String, dynamic> toJson() => {
        "baseFare": baseFare,
        "tax": tax,
        "serviceCharge": serviceCharge,
        "totalFare": totalFare,
        "commission": commission,
        "payable": payable,
        "passengersCount": passengersCount,
        "passengerTypeTotal": passengerTypeTotal.toJson(),
    };
}

class PassengerTypeTotal {
    final double baseFare;
    final double payable;

    PassengerTypeTotal({
        required this.baseFare,
        required this.payable,
    });

    factory PassengerTypeTotal.fromJson(Map<String, dynamic> json) => PassengerTypeTotal(
        baseFare: json["baseFare"]?.toDouble(),
        payable: json["payable"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "baseFare": baseFare,
        "payable": payable,
    };
}

class Currency {
    final int id;
    final Title title;
    final BuyerCurrencyAbb abb;
    final Symbol symbol;
    final int decimalPlaces;

    Currency({
        required this.id,
        required this.title,
        required this.abb,
        required this.symbol,
        required this.decimalPlaces,
    });

    factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        title: titleValues.map[json["title"]]!,
        abb: buyerCurrencyAbbValues.map[json["abb"]]!,
        symbol: symbolValues.map[json["symbol"]]!,
        decimalPlaces: json["decimal_places"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": titleValues.reverse[title],
        "abb": buyerCurrencyAbbValues.reverse[abb],
        "symbol": symbolValues.reverse[symbol],
        "decimal_places": decimalPlaces,
    };
}

enum BuyerCurrencyAbb {
    USD
}

final buyerCurrencyAbbValues = EnumValues({
    "USD": BuyerCurrencyAbb.USD
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

enum SellerCode {
    FP,
    FSA,
    FSC
}

final sellerCodeValues = EnumValues({
    "FP": SellerCode.FP,
    "FSA": SellerCode.FSA,
    "FSC": SellerCode.FSC
});

class ServiceInfo {
    final String supplier;
    final DateTime searchValidity;
    final List<ServiceInfoLeg> legs;
    final ValidatingAirline validatingAirline;
    final PassengersCount passengersCount;
    final String luxotaCode;
    final Support support;

    ServiceInfo({
        required this.supplier,
        required this.searchValidity,
        required this.legs,
        required this.validatingAirline,
        required this.passengersCount,
        required this.luxotaCode,
        required this.support,
    });

    factory ServiceInfo.fromJson(Map<String, dynamic> json) => ServiceInfo(
        supplier: json["supplier"],
        searchValidity: DateTime.parse(json["searchValidity"]),
        legs: List<ServiceInfoLeg>.from(json["legs"].map((x) => ServiceInfoLeg.fromJson(x))),
        validatingAirline: ValidatingAirline.fromJson(json["validatingAirline"]),
        passengersCount: PassengersCount.fromJson(json["passengersCount"]),
        luxotaCode: json["luxotaCode"],
        support: Support.fromJson(json["support"]),
    );

    Map<String, dynamic> toJson() => {
        "supplier": supplier,
        "searchValidity": searchValidity.toIso8601String(),
        "legs": List<dynamic>.from(legs.map((x) => x.toJson())),
        "validatingAirline": validatingAirline.toJson(),
        "passengersCount": passengersCount.toJson(),
        "luxotaCode": luxotaCode,
        "support": support.toJson(),
    };
}

class ServiceInfoLeg {
    final Info info;
    final List<Segment> segments;

    ServiceInfoLeg({
        required this.info,
        required this.segments,
    });

    factory ServiceInfoLeg.fromJson(Map<String, dynamic> json) => ServiceInfoLeg(
        info: Info.fromJson(json["info"]),
        segments: List<Segment>.from(json["segments"].map((x) => Segment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "segments": List<dynamic>.from(segments.map((x) => x.toJson())),
    };
}

class Info {
    final Arrival departure;
    final Arrival arrival;
    final ValidatingAirline airline;
    final Cabin cabin;
    final String luggage;
    final dynamic airplane;
    final String duration;
    final int connections;
    final TicketType ticketType;
    final String flightNumber;
    final CityEnum afterFlightStop;
    final ResBookDesigCode resBookDesigCode;
    final int capacity;
    final String rph;

    Info({
        required this.departure,
        required this.arrival,
        required this.airline,
        required this.cabin,
        required this.luggage,
        required this.airplane,
        required this.duration,
        required this.connections,
        required this.ticketType,
        required this.flightNumber,
        required this.afterFlightStop,
        required this.resBookDesigCode,
        required this.capacity,
        required this.rph,
    });

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        departure: Arrival.fromJson(json["departure"]),
        arrival: Arrival.fromJson(json["arrival"]),
        airline: ValidatingAirline.fromJson(json["airline"]),
        cabin: cabinValues.map[json["cabin"]]!,
        luggage: json["luggage"],
        airplane: json["airplane"],
        duration: json["duration"],
        connections: json["connections"],
        ticketType: ticketTypeValues.map[json["ticket_type"]]!,
        flightNumber: json["flight_number"],
        afterFlightStop: cityEnumValues.map[json["after_flight_stop"]]!,
        resBookDesigCode: resBookDesigCodeValues.map[json["resBookDesigCode"]]!,
        capacity: json["capacity"],
        rph: json["RPH"],
    );

    Map<String, dynamic> toJson() => {
        "departure": departure.toJson(),
        "arrival": arrival.toJson(),
        "airline": airline.toJson(),
        "cabin": cabinValues.reverse[cabin],
        "luggage": luggage,
        "airplane": airplane,
        "duration": duration,
        "connections": connections,
        "ticket_type": ticketTypeValues.reverse[ticketType],
        "flight_number": flightNumber,
        "after_flight_stop": cityEnumValues.reverse[afterFlightStop],
        "resBookDesigCode": resBookDesigCodeValues.reverse[resBookDesigCode],
        "capacity": capacity,
        "RPH": rph,
    };
}

enum CityEnum {
    ANTSIRANANA,
    EMPTY,
    STATE_COLLEGE,
    TERMINAL_X
}

final cityEnumValues = EnumValues({
    "Antsiranana": CityEnum.ANTSIRANANA,
    "-": CityEnum.EMPTY,
    "State College": CityEnum.STATE_COLLEGE,
    "TerminalX": CityEnum.TERMINAL_X
});

class ValidatingAirline {
    final int id;
    final En en;
    final Fa fa;
    final Ar ar;
    final dynamic ku;
    final dynamic tr;
    final SupplierKeyEnum abb;
    final String logo;
    final En title;
    final SupplierKeyEnum supplierKey;
    final int cityId;
    final ValidatingAirline city;
    final int countryId;
    final ValidatingAirline country;

    ValidatingAirline({
        required this.id,
        required this.en,
        required this.fa,
        required this.ar,
        required this.ku,
        required this.tr,
        required this.abb,
        required this.logo,
        required this.title,
        required this.supplierKey,
        required this.cityId,
        required this.city,
        required this.countryId,
        required this.country,
    });

    factory ValidatingAirline.fromJson(Map<String, dynamic> json) => ValidatingAirline(
        id: json["id"],
        en: enValues.map[json["en"]]!,
        fa: faValues.map[json["fa"]]!,
        ar: arValues.map[json["ar"]]!,
        ku: json["ku"],
        tr: json["tr"],
        abb: supplierKeyEnumValues.map[json["abb"]]!,
        logo: json["logo"],
        title: enValues.map[json["title"]]!,
        supplierKey: supplierKeyEnumValues.map[json["supplier_key"]]!,
        cityId: json["city_id"],
        city: ValidatingAirline.fromJson(json["city"]),
        countryId: json["country_id"],
        country: ValidatingAirline.fromJson(json["country"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "en": enValues.reverse[en],
        "fa": faValues.reverse[fa],
        "ar": arValues.reverse[ar],
        "ku": ku,
        "tr": tr,
        "abb": supplierKeyEnumValues.reverse[abb],
        "logo": logo,
        "title": enValues.reverse[title],
        "supplier_key": supplierKeyEnumValues.reverse[supplierKey],
        "city_id": cityId,
        "city": city.toJson(),
        "country_id": countryId,
        "country": country.toJson(),
    };
}

enum SupplierKeyEnum {
    DIE,
    EK,
    G9,
    KU,
    ME,
    MG,
    RJ,
    SCE,
    SU,
    US,
    W5
}

final supplierKeyEnumValues = EnumValues({
    "DIE": SupplierKeyEnum.DIE,
    "EK": SupplierKeyEnum.EK,
    "G9": SupplierKeyEnum.G9,
    "KU": SupplierKeyEnum.KU,
    "ME": SupplierKeyEnum.ME,
    "MG": SupplierKeyEnum.MG,
    "RJ": SupplierKeyEnum.RJ,
    "SCE": SupplierKeyEnum.SCE,
    "SU": SupplierKeyEnum.SU,
    "US": SupplierKeyEnum.US,
    "W5": SupplierKeyEnum.W5
});

enum Ar {
    AR,
    EMPTY,
    FLUFFY,
    PURPLE,
    STICKY,
    TENTACLED
}

final arValues = EnumValues({
    "كلية الدولة": Ar.AR,
    "جامعة بارك": Ar.EMPTY,
    "أراتشارت": Ar.FLUFFY,
    "الولايات المتحدة": Ar.PURPLE,
    "مدغشقر": Ar.STICKY,
    "أنتسيرانانا": Ar.TENTACLED
});

enum En {
    AEROFLOT,
    AIR_ARABIA,
    ANTSIRANANA,
    EMIRATES,
    KUWAIT_AIRWAYS,
    MADAGASCAR,
    MAHAN_AIRLINES,
    MIDDLE_EAST_AIRLINES,
    ROYAL_JORDANIAN,
    STATE_COLLEGE,
    UNITED_STATES_OF_AMERICA,
    UNIVERSITY_PARK
}

final enValues = EnumValues({
    "Aeroflot": En.AEROFLOT,
    "Air Arabia": En.AIR_ARABIA,
    "Antsiranana": En.ANTSIRANANA,
    "Emirates": En.EMIRATES,
    "Kuwait Airways": En.KUWAIT_AIRWAYS,
    "Madagascar": En.MADAGASCAR,
    "Mahan Airlines": En.MAHAN_AIRLINES,
    "Middle East Airlines": En.MIDDLE_EAST_AIRLINES,
    "Royal Jordanian": En.ROYAL_JORDANIAN,
    "State College": En.STATE_COLLEGE,
    "United States Of America": En.UNITED_STATES_OF_AMERICA,
    "University Park": En.UNIVERSITY_PARK
});

enum Fa {
    EMPTY,
    FA,
    FLUFFY,
    INDECENT,
    INDIGO,
    PURPLE,
    STICKY,
    TENTACLED
}

final faValues = EnumValues({
    "هواپیمایی ماهان": Fa.EMPTY,
    "ایرعربیا": Fa.FA,
    "ایرفلوت": Fa.FLUFFY,
    "ماداگاسکار": Fa.INDECENT,
    "آمریکا": Fa.INDIGO,
    "": Fa.PURPLE,
    "هواپیمایی امارات": Fa.STICKY,
    "کویت ایرویز": Fa.TENTACLED
});

class Arrival {
    final CityEnum city;
    final String time;
    final ValidatingAirline airport;
    final CityEnum terminal;
    final String dateTime;
    final String rawTime;

    Arrival({
        required this.city,
        required this.time,
        required this.airport,
        required this.terminal,
        required this.dateTime,
        required this.rawTime,
    });

    factory Arrival.fromJson(Map<String, dynamic> json) => Arrival(
        city: cityEnumValues.map[json["city"]]!,
        time: json["time"],
        airport: ValidatingAirline.fromJson(json["airport"]),
        terminal: cityEnumValues.map[json["terminal"]]!,
        dateTime: json["date_time"],
        rawTime: json["raw_time"],
    );

    Map<String, dynamic> toJson() => {
        "city": cityEnumValues.reverse[city],
        "time": time,
        "airport": airport.toJson(),
        "terminal": cityEnumValues.reverse[terminal],
        "date_time": dateTime,
        "raw_time": rawTime,
    };
}

enum Cabin {
    ECONOMY
}

final cabinValues = EnumValues({
    "Economy": Cabin.ECONOMY
});

enum ResBookDesigCode {
    EMPTY,
    Q,
    V0
}

final resBookDesigCodeValues = EnumValues({
    "": ResBookDesigCode.EMPTY,
    "Q": ResBookDesigCode.Q,
    "V0": ResBookDesigCode.V0
});

enum TicketType {
    SYSTEM
}

final ticketTypeValues = EnumValues({
    "system": TicketType.SYSTEM
});

class Segment {
    final Arrival departure;
    final Arrival arrival;
    final ValidatingAirline airline;
    final ValidatingAirline operatingAirline;
    final Cabin cabin;
    final Luggage luggage;
    final dynamic airplane;
    final String duration;
    final TicketType ticketType;
    final dynamic flightNumber;
    final SegmentAfterFlightStop afterFlightStop;
    final ResBookDesigCode resBookDesigCode;
    final int capacity;
    final String rph;

    Segment({
        required this.departure,
        required this.arrival,
        required this.airline,
        required this.operatingAirline,
        required this.cabin,
        required this.luggage,
        required this.airplane,
        required this.duration,
        required this.ticketType,
        required this.flightNumber,
        required this.afterFlightStop,
        required this.resBookDesigCode,
        required this.capacity,
        required this.rph,
    });

    factory Segment.fromJson(Map<String, dynamic> json) => Segment(
        departure: Arrival.fromJson(json["departure"]),
        arrival: Arrival.fromJson(json["arrival"]),
        airline: ValidatingAirline.fromJson(json["airline"]),
        operatingAirline: ValidatingAirline.fromJson(json["operatingAirline"]),
        cabin: cabinValues.map[json["cabin"]]!,
        luggage: luggageValues.map[json["luggage"]]!,
        airplane: json["airplane"],
        duration: json["duration"],
        ticketType: ticketTypeValues.map[json["ticket_type"]]!,
        flightNumber: json["flight_number"],
        afterFlightStop: segmentAfterFlightStopValues.map[json["after_flight_stop"]]!,
        resBookDesigCode: resBookDesigCodeValues.map[json["resBookDesigCode"]]!,
        capacity: json["capacity"],
        rph: json["RPH"],
    );

    Map<String, dynamic> toJson() => {
        "departure": departure.toJson(),
        "arrival": arrival.toJson(),
        "airline": airline.toJson(),
        "operatingAirline": operatingAirline.toJson(),
        "cabin": cabinValues.reverse[cabin],
        "luggage": luggageValues.reverse[luggage],
        "airplane": airplane,
        "duration": duration,
        "ticket_type": ticketTypeValues.reverse[ticketType],
        "flight_number": flightNumber,
        "after_flight_stop": segmentAfterFlightStopValues.reverse[afterFlightStop],
        "resBookDesigCode": resBookDesigCodeValues.reverse[resBookDesigCode],
        "capacity": capacity,
        "RPH": rph,
    };
}

enum SegmentAfterFlightStop {
    THE_00,
    THE_0000
}

final segmentAfterFlightStopValues = EnumValues({
    "0:0": SegmentAfterFlightStop.THE_00,
    "00:00": SegmentAfterFlightStop.THE_0000
});

enum Luggage {
    NO_BAG,
    THE_20_K,
    THE_20_KG
}

final luggageValues = EnumValues({
    "No Bag": Luggage.NO_BAG,
    "20K": Luggage.THE_20_K,
    "20/KG": Luggage.THE_20_KG
});

class PassengersCount {
    final int adults;
    final int children;
    final int infants;

    PassengersCount({
        required this.adults,
        required this.children,
        required this.infants,
    });

    factory PassengersCount.fromJson(Map<String, dynamic> json) => PassengersCount(
        adults: json["adults"],
        children: json["children"],
        infants: json["infants"],
    );

    Map<String, dynamic> toJson() => {
        "adults": adults,
        "children": children,
        "infants": infants,
    };
}

class Support {
    final Pid pid;

    Support({
        required this.pid,
    });

    factory Support.fromJson(Map<String, dynamic> json) => Support(
        pid: Pid.fromJson(json["pid"]),
    );

    Map<String, dynamic> toJson() => {
        "pid": pid.toJson(),
    };
}

class Pid {
    final Search search;

    Pid({
        required this.search,
    });

    factory Pid.fromJson(Map<String, dynamic> json) => Pid(
        search: searchValues.map[json["search"]]!,
    );

    Map<String, dynamic> toJson() => {
        "search": searchValues.reverse[search],
    };
}

enum Search {
    THE_6621022_C79008
}

final searchValues = EnumValues({
    "6621022c79008": Search.THE_6621022_C79008
});

class Filters {
    final Price price;
    final Map<String, Airline> airlines;
    final List<String> departStop;
    final List<dynamic> returnStop;
    final List<int> departurePeriod;
    final List<dynamic> returnPeriod;
    final List<AirlineLowPrice> airlineLowPrice;

    Filters({
        required this.price,
        required this.airlines,
        required this.departStop,
        required this.returnStop,
        required this.departurePeriod,
        required this.returnPeriod,
        required this.airlineLowPrice,
    });

    factory Filters.fromJson(Map<String, dynamic> json) => Filters(
        price: Price.fromJson(json["price"]),
        airlines: Map.from(json["airlines"]).map((k, v) => MapEntry<String, Airline>(k, Airline.fromJson(v))),
        departStop: List<String>.from(json["departStop"].map((x) => x)),
        returnStop: List<dynamic>.from(json["returnStop"].map((x) => x)),
        departurePeriod: List<int>.from(json["departurePeriod"].map((x) => x)),
        returnPeriod: List<dynamic>.from(json["returnPeriod"].map((x) => x)),
        airlineLowPrice: List<AirlineLowPrice>.from(json["airlineLowPrice"].map((x) => AirlineLowPrice.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "price": price.toJson(),
        "airlines": Map.from(airlines).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "departStop": List<dynamic>.from(departStop.map((x) => x)),
        "returnStop": List<dynamic>.from(returnStop.map((x) => x)),
        "departurePeriod": List<dynamic>.from(departurePeriod.map((x) => x)),
        "returnPeriod": List<dynamic>.from(returnPeriod.map((x) => x)),
        "airlineLowPrice": List<dynamic>.from(airlineLowPrice.map((x) => x.toJson())),
    };
}

class AirlineLowPrice {
    final The0 the0;
    final double price;
    final int airlineId;

    AirlineLowPrice({
        required this.the0,
        required this.price,
        required this.airlineId,
    });

    factory AirlineLowPrice.fromJson(Map<String, dynamic> json) => AirlineLowPrice(
        the0: The0.fromJson(json["0"]),
        price: json["price"]?.toDouble(),
        airlineId: json["airlineId"],
    );

    Map<String, dynamic> toJson() => {
        "0": the0.toJson(),
        "price": price,
        "airlineId": airlineId,
    };
}

class The0 {
    final double price;
    final String departDuration;
    final String returnDuration;

    The0({
        required this.price,
        required this.departDuration,
        required this.returnDuration,
    });

    factory The0.fromJson(Map<String, dynamic> json) => The0(
        price: json["price"]?.toDouble(),
        departDuration: json["departDuration"],
        returnDuration: json["returnDuration"],
    );

    Map<String, dynamic> toJson() => {
        "price": price,
        "departDuration": departDuration,
        "returnDuration": returnDuration,
    };
}

class Airline {
    final int id;
    final String en;
    final int countryId;
    final String logo;
    final String abb;
    final int status;
    final dynamic deletedAt;
    final String fa;
    final Ar ar;
    final int frequency;
    final dynamic ku;
    final dynamic tr;
    final String title;
    final int cityId;
    final int priority;
    final dynamic timezone;

    Airline({
        required this.id,
        required this.en,
        required this.countryId,
        required this.logo,
        required this.abb,
        required this.status,
        required this.deletedAt,
        required this.fa,
        required this.ar,
        required this.frequency,
        required this.ku,
        required this.tr,
        required this.title,
        required this.cityId,
        required this.priority,
        required this.timezone,
    });

    factory Airline.fromJson(Map<String, dynamic> json) => Airline(
        id: json["id"],
        en: json["en"],
        countryId: json["country_id"],
        logo: json["logo"],
        abb: json["abb"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        fa: json["fa"],
        ar: arValues.map[json["ar"]]!,
        frequency: json["frequency"],
        ku: json["ku"],
        tr: json["tr"],
        title: json["title"],
        cityId: json["city_id"],
        priority: json["priority"],
        timezone: json["timezone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "en": en,
        "country_id": countryId,
        "logo": logo,
        "abb": abb,
        "status": status,
        "deleted_at": deletedAt,
        "fa": fa,
        "ar": arValues.reverse[ar],
        "frequency": frequency,
        "ku": ku,
        "tr": tr,
        "title": title,
        "city_id": cityId,
        "priority": priority,
        "timezone": timezone,
    };
}

class Price {
    final double min;
    final double max;
    final String minPriceByNodeCurrency;

    Price({
        required this.min,
        required this.max,
        required this.minPriceByNodeCurrency,
    });

    factory Price.fromJson(Map<String, dynamic> json) => Price(
        min: json["min"]?.toDouble(),
        max: json["max"]?.toDouble(),
        minPriceByNodeCurrency: json["minPriceByNodeCurrency"],
    );

    Map<String, dynamic> toJson() => {
        "min": min,
        "max": max,
        "minPriceByNodeCurrency": minPriceByNodeCurrency,
    };
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
    final List<QueryParamsLeg> legs;
    final DateTime departure;
    final dynamic queryParamsReturn;
    final Cabin cabin;
    final int adults;
    final int children;
    final int infants;
    final Destination origin;
    final Destination destination;
    final int buyerId;
    final String charterOnly;
    final Currency marketplaceCurrency;
    final Currency buyerCurrency;
    final String currentLang;
    final dynamic departureShamsiDate;
    final dynamic returnShamsiDate;
    final String tripType;
    final int version;
    final String apiVersion;

    QueryParams({
        required this.legs,
        required this.departure,
        required this.queryParamsReturn,
        required this.cabin,
        required this.adults,
        required this.children,
        required this.infants,
        required this.origin,
        required this.destination,
        required this.buyerId,
        required this.charterOnly,
        required this.marketplaceCurrency,
        required this.buyerCurrency,
        required this.currentLang,
        required this.departureShamsiDate,
        required this.returnShamsiDate,
        required this.tripType,
        required this.version,
        required this.apiVersion,
    });

    factory QueryParams.fromJson(Map<String, dynamic> json) => QueryParams(
        legs: List<QueryParamsLeg>.from(json["legs"].map((x) => QueryParamsLeg.fromJson(x))),
        departure: DateTime.parse(json["departure"]),
        queryParamsReturn: json["return"],
        cabin: cabinValues.map[json["cabin"]]!,
        adults: json["adults"],
        children: json["children"],
        infants: json["infants"],
        origin: Destination.fromJson(json["origin"]),
        destination: Destination.fromJson(json["destination"]),
        buyerId: json["buyer_id"],
        charterOnly: json["charterOnly"],
        marketplaceCurrency: Currency.fromJson(json["marketplace_currency"]),
        buyerCurrency: Currency.fromJson(json["buyer_currency"]),
        currentLang: json["current_lang"],
        departureShamsiDate: json["departureShamsiDate"],
        returnShamsiDate: json["returnShamsiDate"],
        tripType: json["tripType"],
        version: json["version"],
        apiVersion: json["apiVersion"],
    );

    Map<String, dynamic> toJson() => {
        "legs": List<dynamic>.from(legs.map((x) => x.toJson())),
        "departure": "${departure.year.toString().padLeft(4, '0')}-${departure.month.toString().padLeft(2, '0')}-${departure.day.toString().padLeft(2, '0')}",
        "return": queryParamsReturn,
        "cabin": cabinValues.reverse[cabin],
        "adults": adults,
        "children": children,
        "infants": infants,
        "origin": origin.toJson(),
        "destination": destination.toJson(),
        "buyer_id": buyerId,
        "charterOnly": charterOnly,
        "marketplace_currency": marketplaceCurrency.toJson(),
        "buyer_currency": buyerCurrency.toJson(),
        "current_lang": currentLang,
        "departureShamsiDate": departureShamsiDate,
        "returnShamsiDate": returnShamsiDate,
        "tripType": tripType,
        "version": version,
        "apiVersion": apiVersion,
    };
}

class Destination {
    final Airline city;
    final Airline airport;
    final Buffer buffer;

    Destination({
        required this.city,
        required this.airport,
        required this.buffer,
    });

    factory Destination.fromJson(Map<String, dynamic> json) => Destination(
        city: Airline.fromJson(json["city"]),
        airport: Airline.fromJson(json["airport"]),
        buffer: Buffer.fromJson(json["buffer"]),
    );

    Map<String, dynamic> toJson() => {
        "city": city.toJson(),
        "airport": airport.toJson(),
        "buffer": buffer.toJson(),
    };
}

class Buffer {
    final int id;
    final String title;
    final String text;
    final int cityId;
    final int airportId;
    final String language;
    final Airline city;
    final Airline airport;

    Buffer({
        required this.id,
        required this.title,
        required this.text,
        required this.cityId,
        required this.airportId,
        required this.language,
        required this.city,
        required this.airport,
    });

    factory Buffer.fromJson(Map<String, dynamic> json) => Buffer(
        id: json["id"],
        title: json["title"],
        text: json["text"],
        cityId: json["city_id"],
        airportId: json["airport_id"],
        language: json["language"],
        city: Airline.fromJson(json["city"]),
        airport: Airline.fromJson(json["airport"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "text": text,
        "city_id": cityId,
        "airport_id": airportId,
        "language": language,
        "city": city.toJson(),
        "airport": airport.toJson(),
    };
}

class QueryParamsLeg {
    final DateTime departure;
    final dynamic departureShamsiDate;
    final Destination origin;
    final Destination destination;

    QueryParamsLeg({
        required this.departure,
        required this.departureShamsiDate,
        required this.origin,
        required this.destination,
    });

    factory QueryParamsLeg.fromJson(Map<String, dynamic> json) => QueryParamsLeg(
        departure: DateTime.parse(json["departure"]),
        departureShamsiDate: json["departureShamsiDate"],
        origin: Destination.fromJson(json["origin"]),
        destination: Destination.fromJson(json["destination"]),
    );

    Map<String, dynamic> toJson() => {
        "departure": "${departure.year.toString().padLeft(4, '0')}-${departure.month.toString().padLeft(2, '0')}-${departure.day.toString().padLeft(2, '0')}",
        "departureShamsiDate": departureShamsiDate,
        "origin": origin.toJson(),
        "destination": destination.toJson(),
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
