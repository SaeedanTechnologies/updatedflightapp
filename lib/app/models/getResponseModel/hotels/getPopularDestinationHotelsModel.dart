// To parse this JSON data, do
//
//     final getPopularHotelsDestinations = getPopularHotelsDestinationsFromJson(jsonString);

import 'dart:convert';

GetPopularHotelsDestinations getPopularHotelsDestinationsFromJson(String str) => GetPopularHotelsDestinations.fromJson(json.decode(str));

String getPopularHotelsDestinationsToJson(GetPopularHotelsDestinations data) => json.encode(data.toJson());

class GetPopularHotelsDestinations {
    final bool? status;
    final List<Datum>? data;

    GetPopularHotelsDestinations({
        this.status,
        this.data,
    });

    factory GetPopularHotelsDestinations.fromJson(Map<String, dynamic> json) => GetPopularHotelsDestinations(
        status: json["status"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    final String? language;
    final int? cityId;
    final String? cityBufferTitle;
    final String? cityAbb;
    final String? cityEn;
    final int? countryId;
    final String? countryAbb;
    final String? countryEn;

    Datum({
        this.language,
        this.cityId,
        this.cityBufferTitle,
        this.cityAbb,
        this.cityEn,
        this.countryId,
        this.countryAbb,
        this.countryEn,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        language: json["language"],
        cityId: json["city_id"],
        cityBufferTitle: json["city_buffer_title"],
        cityAbb: json["city_abb"],
        cityEn: json["city_en"],
        countryId: json["country_id"],
        countryAbb: json["country_abb"],
        countryEn: json["country_en"],
    );

    Map<String, dynamic> toJson() => {
        "language": language,
        "city_id": cityId,
        "city_buffer_title": cityBufferTitle,
        "city_abb": cityAbb,
        "city_en": cityEn,
        "country_id": countryId,
        "country_abb": countryAbb,
        "country_en": countryEn,
    };
}
