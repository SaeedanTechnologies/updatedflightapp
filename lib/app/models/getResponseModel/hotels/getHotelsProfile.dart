// To parse this JSON data, do
//
//     final getHotelProfile = getHotelProfileFromJson(jsonString);

import 'dart:convert';

GetHotelProfile getHotelProfileFromJson(String str) => GetHotelProfile.fromJson(json.decode(str));

String getHotelProfileToJson(GetHotelProfile data) => json.encode(data.toJson());

class GetHotelProfile {
    final bool? status;
    final Profile? profile;
    final List<Room>? rooms;

    GetHotelProfile({
        this.status,
        this.profile,
        this.rooms,
    });

    factory GetHotelProfile.fromJson(Map<String, dynamic> json) => GetHotelProfile(
        status: json["status"],
        profile: json["profile"] == null ? null : Profile.fromJson(json["profile"]),
        rooms: json["rooms"] == null ? [] : List<Room>.from(json["rooms"]!.map((x) => Room.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "profile": profile?.toJson(),
        "rooms": rooms == null ? [] : List<dynamic>.from(rooms!.map((x) => x.toJson())),
    };
}

class Profile {
    final int? hotelId;
    final String? code;
    final int? status;
    final String? phone;
    final String? attractions;
    final String? description;
    final String? facilities;
    final String? images;
    final int? rating;
    final String? address;
    final int? tripAdvisor;
    final String? tripAdvisorUrl;
    final String? districts;
    final String? rooms;
    final dynamic deletedAt;

    Profile({
        this.hotelId,
        this.code,
        this.status,
        this.phone,
        this.attractions,
        this.description,
        this.facilities,
        this.images,
        this.rating,
        this.address,
        this.tripAdvisor,
        this.tripAdvisorUrl,
        this.districts,
        this.rooms,
        this.deletedAt,
    });

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        hotelId: json["hotel_id"],
        code: json["code"],
        status: json["status"],
        phone: json["phone"],
        attractions: json["attractions"],
        description: json["description"],
        facilities: json["facilities"],
        images: json["images"],
        rating: json["rating"],
        address: json["address"],
        tripAdvisor: json["trip_advisor"],
        tripAdvisorUrl: json["trip_advisor_url"],
        districts: json["districts"],
        rooms: json["rooms"],
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "hotel_id": hotelId,
        "code": code,
        "status": status,
        "phone": phone,
        "attractions": attractions,
        "description": description,
        "facilities": facilities,
        "images": images,
        "rating": rating,
        "address": address,
        "trip_advisor": tripAdvisor,
        "trip_advisor_url": tripAdvisorUrl,
        "districts": districts,
        "rooms": rooms,
        "deleted_at": deletedAt,
    };
}

class Room {
    final String? name;
    final String? index;
    final String? planCode;
    final List<dynamic>? promtion;
    final String? typeCode;
    final List<String>? amenities;
    final Inclusion? inclusion;
    final double? totalB2B;
    final int? totalB2C;
    final CancelationPolicies? cancelationPolicies;

    Room({
        this.name,
        this.index,
        this.planCode,
        this.promtion,
        this.typeCode,
        this.amenities,
        this.inclusion,
        this.totalB2B,
        this.totalB2C,
        this.cancelationPolicies,
    });

    factory Room.fromJson(Map<String, dynamic> json) => Room(
        name: json["name"],
        index: json["index"],
        planCode: json["planCode"],
        promtion: json["promtion"] == null ? [] : List<dynamic>.from(json["promtion"]!.map((x) => x)),
        typeCode: json["typeCode"],
        amenities: json["amenities"] == null ? [] : List<String>.from(json["amenities"]!.map((x) => x)),
        inclusion: inclusionValues.map[json["inclusion"]]!,
        totalB2B: json["total_b2b"]?.toDouble(),
        totalB2C: json["total_b2c"],
        cancelationPolicies: json["cancelationPolicies"] == null ? null : CancelationPolicies.fromJson(json["cancelationPolicies"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "index": index,
        "planCode": planCode,
        "promtion": promtion == null ? [] : List<dynamic>.from(promtion!.map((x) => x)),
        "typeCode": typeCode,
        "amenities": amenities == null ? [] : List<dynamic>.from(amenities!.map((x) => x)),
        "inclusion": inclusionValues.reverse[inclusion],
        "total_b2b": totalB2B,
        "total_b2c": totalB2C,
        "cancelationPolicies": cancelationPolicies?.toJson(),
    };
}

class CancelationPolicies {
    final List<Policy>? policies;
    final String? defaultPolicy;
    final DateTime? lastCancellationDeadline;

    CancelationPolicies({
        this.policies,
        this.defaultPolicy,
        this.lastCancellationDeadline,
    });

    factory CancelationPolicies.fromJson(Map<String, dynamic> json) => CancelationPolicies(
        policies: json["policies"] == null ? [] : List<Policy>.from(json["policies"]!.map((x) => Policy.fromJson(x))),
        defaultPolicy: json["defaultPolicy"],
        lastCancellationDeadline: json["lastCancellationDeadline"] == null ? null : DateTime.parse(json["lastCancellationDeadline"]),
    );

    Map<String, dynamic> toJson() => {
        "policies": policies == null ? [] : List<dynamic>.from(policies!.map((x) => x.toJson())),
        "defaultPolicy": defaultPolicy,
        "lastCancellationDeadline": lastCancellationDeadline?.toIso8601String(),
    };
}

class Policy {
    final DateTime? toDate;
    final Currency? currency;
    final DateTime? fromDate;
    final String? cancellationCharge;

    Policy({
        this.toDate,
        this.currency,
        this.fromDate,
        this.cancellationCharge,
    });

    factory Policy.fromJson(Map<String, dynamic> json) => Policy(
        toDate: json["toDate"] == null ? null : DateTime.parse(json["toDate"]),
        currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
        fromDate: json["fromDate"] == null ? null : DateTime.parse(json["fromDate"]),
        cancellationCharge: json["cancellationCharge"],
    );

    Map<String, dynamic> toJson() => {
        "toDate": "${toDate!.year.toString().padLeft(4, '0')}-${toDate!.month.toString().padLeft(2, '0')}-${toDate!.day.toString().padLeft(2, '0')}",
        "currency": currency?.toJson(),
        "fromDate": "${fromDate!.year.toString().padLeft(4, '0')}-${fromDate!.month.toString().padLeft(2, '0')}-${fromDate!.day.toString().padLeft(2, '0')}",
        "cancellationCharge": cancellationCharge,
    };
}

class Currency {
    final int? id;
    final Abb? abb;
    final Title? title;
    final Symbol? symbol;
    final dynamic createdAt;
    final dynamic deletedAt;
    final dynamic updatedAt;

    Currency({
        this.id,
        this.abb,
        this.title,
        this.symbol,
        this.createdAt,
        this.deletedAt,
        this.updatedAt,
    });

    factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        abb: abbValues.map[json["abb"]]!,
        title: titleValues.map[json["title"]]!,
        symbol: symbolValues.map[json["symbol"]]!,
        createdAt: json["created_at"],
        deletedAt: json["deleted_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "abb": abbValues.reverse[abb],
        "title": titleValues.reverse[title],
        "symbol": symbolValues.reverse[symbol],
        "created_at": createdAt,
        "deleted_at": deletedAt,
        "updated_at": updatedAt,
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

enum Inclusion {
    BED_AND_BREAKFAST,
    ROOM_ONLY
}

final inclusionValues = EnumValues({
    "BED AND BREAKFAST": Inclusion.BED_AND_BREAKFAST,
    "ROOM ONLY": Inclusion.ROOM_ONLY
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
